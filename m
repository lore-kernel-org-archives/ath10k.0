Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acPry-0007lc-7c
 for ath10k@lists.infradead.org; Sun, 06 Mar 2016 04:00:39 +0000
MIME-Version: 1.0
Date: Sun, 06 Mar 2016 09:30:15 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH] ath10k: move mgmt descriptor limit handle under mgmt_tx
In-Reply-To: <56DAED8E.6020407@candelatech.com>
References: <1457187017-12913-1-git-send-email-rmanohar@qti.qualcomm.com>
 <56DAED8E.6020407@candelatech.com>
Message-ID: <08ae455b4733d8c1607427b10acc759c@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

On , Ben Greear wrote:
> On 03/05/2016 06:10 AM, Rajkumar Manoharan wrote:
>> Firmware reserves few descriptors for management frames transmission.
>> In 16 MBSSID scenario, these slots will be easy exhausted due to 
>> frequent
>> probe responses. So for 10.4 based solutions, probe responses are 
>> limited
>> by a threshold (24).
> 
> Do you mean probe requests or probe responses?
> 
I meant probe responses in AP mode.

> A single hardware scan request with lots of ssids in it will utilize 
> all
> firmware tx management frames (which is 5, it seems).  In my testing, 
> the
> firmware would just never send probe requests for the rest of the ssids
> because the firmware scan state machine logic is broken.
> 
Hmm... firmware expects both ssid and bssid list to be filled for 
multiple probe
requests. Better to try with different probe spacing time, repeat probe 
time and
probe delay and dwell time as these params change prob_req behavior in 
firmware.

Anyway this change is not related to scan functionality.

> If you really do mean responses, then it sounds like it would be better 
> to
> use the normal RX path for mgt frames in the firmware...
> 
Let me clarify. Sending probe responses in AP mode are limited by a 
threshold
for qca99x0 ("ath10k: drop probe responses when too many are queued"). 
This change
moves probe response checks under mgmt_tx from common data path.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
