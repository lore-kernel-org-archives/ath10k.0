Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs7Md-0005j4-NW
 for ath10k@lists.infradead.org; Fri, 08 Feb 2019 14:43:04 +0000
MIME-Version: 1.0
Date: Fri, 08 Feb 2019 20:12:35 +0530
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fix shadow register implementation for WCN3990
In-Reply-To: <20190208141735.43AF360734@smtp.codeaurora.org>
References: <1548755647-23356-1-git-send-email-pillair@codeaurora.org>
 <20190208141735.43AF360734@smtp.codeaurora.org>
Message-ID: <566bdcf168c95646e1a0d2689649025d@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Kalle,
I have checked the patch, and it is fine.

Thanks,
Rakesh Pillai.

On 2019-02-08 19:47, Kalle Valo wrote:
> Rakesh Pillai <pillair@codeaurora.org> wrote:
> 
>> WCN3990 supports shadow registers write operation support
>> for copy engine for regular operation in powersave mode.
>> 
>> Since WCN3990 is a 64-bit target, the shadow register
>> implementation needs to be done in the copy engine handlers
>> for 64-bit target. Currently the shadow register implementation
>> is present in the 32-bit target handlers of copy engine.
>> 
>> Fix the shadow register copy engine write operation
>> implementation for 64-bit target(WCN3990).
>> 
>> Tested HW: WCN3990
>> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
>> 
>> Fixes: b7ba83f7c414 ("ath10k: add support for shadow register for 
>> WNC3990")
>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> I was able to apply with 3-way merge but please double check the 
> results:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=45112636f48a180c2867c78731ea28ac665495d9
> 
> Applying: ath10k: Fix shadow register implementation for WCN3990
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath10k/ce.c
> M       drivers/net/wireless/ath/ath10k/ce.h
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath10k/ce.h
> Auto-merging drivers/net/wireless/ath/ath10k/ce.c

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
