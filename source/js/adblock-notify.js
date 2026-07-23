document.addEventListener('DOMContentLoaded', function() {
    // 1. Insert CSS for the modal
    const style = document.createElement('style');
    style.innerHTML = `
        #adblock-modal {
            display: none;
            position: fixed;
            z-index: 10000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.85);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            backdrop-filter: blur(5px);
        }
        #adblock-modal-content {
            background-color: #2c2c2c; /* Dark theme to match aurora */
            color: #e0e0e0;
            margin: 10% auto;
            padding: 30px;
            border: 1px solid #444;
            width: 90%;
            max-width: 450px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.5);
        }
        #adblock-modal h2 {
            color: #ff5252;
            margin-top: 0;
            margin-bottom: 15px;
            font-size: 24px;
        }
        #adblock-modal p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 20px;
            color: #ccc;
        }
        #adblock-modal .btn {
            background-color: #ff5252;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        #adblock-modal .btn:hover {
            background-color: #ff1744;
        }
        .adblock-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
    `;
    document.head.appendChild(style);

    // 2. Insert HTML for the modal
    const modal = document.createElement('div');
    modal.id = 'adblock-modal';
    modal.innerHTML = `
        <div id="adblock-modal-content">
            <div class="adblock-icon">🛡️</div>
            <h2>AdBlock Detected</h2>
            <p>It looks like you're using an ad blocker. That's okay, but this site relies on ads to stay free and keep the servers running.</p>
            <p>Please consider <strong>whitelisting</strong> our site or <strong>disabling</strong> your ad blocker to support us.</p>
            <button class="btn" onclick="location.reload()">I've Unblocked It!</button>
        </div>
    `;
    document.body.appendChild(modal);

    // 3. Robust Detection Logic
    // Create a bait element that looks like an ad to adblockers
    const bait = document.createElement('div');
    bait.innerHTML = '&nbsp;';
    bait.className = 'adsbygoogle ad-banner';
    bait.style.display = 'block';
    bait.style.position = 'absolute';
    bait.style.top = '-999px';
    bait.style.height = '1px';
    bait.style.width = '1px';
    document.body.appendChild(bait);

    // Check after a short delay
    setTimeout(function() {
        const isBlocked = (
            bait.offsetHeight === 0 || 
            window.getComputedStyle(bait).display === 'none' || 
            window.getComputedStyle(bait).visibility === 'hidden'
        );
        
        if (isBlocked) {
            console.log('AdBlock detected!');
            document.getElementById('adblock-modal').style.display = 'block';
            document.body.style.overflow = 'hidden'; // Prevent scrolling
        }
        bait.remove();
    }, 2000); // 2 seconds delay to ensure adblocker has run
});
