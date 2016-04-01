Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alrPG-0003Rx-Hy
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 05:14:02 +0000
MIME-Version: 1.0
Date: Fri, 01 Apr 2016 10:43:38 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 2/3] ath10k: remove unnecessary warning for probe response
 drops
In-Reply-To: <56FD5716.6030406@candelatech.com>
References: <1459352551-11773-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1459352551-11773-2-git-send-email-rmanohar@qti.qualcomm.com>
 <56FD5716.6030406@candelatech.com>
Message-ID: <43fd44912f230a28f0f49e303c0078f5@codeaurora.org>
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

On 2016-03-31 22:27, Ben Greear wrote:
> On 03/30/2016 08:42 AM, Rajkumar Manoharan wrote:
>> qca99x0 and qca4019 solutions limit probe responses transmissions.
>> Logging warning message for each probe response drop is flooding
>> kernel log unnecessary with " failed to increase tx mgmt pending
>> count: -16, dropping". Hence reducing log level to debug.
> 
> Is there any realistic way to see this message if we are not running
> many vAP on one radio?
> 
As of now this message can be seen only with qca99x0 which has 24 as 
max_probe_resp_desc_thres. Only possible way in single vAP is that in 
congested environment when DUT is receiving probe requests more 
frequently.

> I guess many probe requests or other management frames could also
> cause this problem?
> 
Exactly.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
