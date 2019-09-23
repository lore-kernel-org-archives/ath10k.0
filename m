Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCMBR-000798-70
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 11:07:10 +0000
MIME-Version: 1.0
Date: Mon, 23 Sep 2019 19:07:07 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: add fw coredump for sdio when firmware assert
In-Reply-To: <878sqhc25h.fsf@codeaurora.org>
References: <1567132338-7407-1-git-send-email-wgong@codeaurora.org>
 <878sqhc25h.fsf@codeaurora.org>
Message-ID: <706142499b2f13de278262f3c52c2047@codeaurora.org>
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

On 2019-09-21 19:35, Kalle Valo wrote:
> 
> The commit log tells nothing about fast, it should always document the
> design decisions. Why this fast dump, what's the benefit? Why not 
> always
> use the fast dump and forget the slow dump (or vice versa)? There needs
> to be really good reasons to have all this complexity to support both
> slow and fast dumps.
fastdump is new added in fimrware of sdio, so if it is use old firmeare, 
then it will
not support fastdump, then it need to use slow dump type.
it is to compatibility for old/new version firmware.
> 
>> +	ath10k_err(ar, "check fw reg : %x\n", param);
>> +}
> 
> This is a debug message, not an error. And debug messages should use
> format "sdio hi_option_flag2 %x\n".

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
