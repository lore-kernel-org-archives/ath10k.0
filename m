Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiFhe-00014H-Cs
 for ath10k@lists.infradead.org; Mon, 08 Jun 2020 11:12:34 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Avoid override CE5 configuration for QCA99X0
 chipsets
References: <1587649759-14381-1-git-send-email-mkenna@codeaurora.org>
 <20200505073422.BFA51C433BA@smtp.codeaurora.org>
 <63ec6f30-ee3b-c412-7c56-46d447b17c8e@dd-wrt.com>
 <87ftbisqgf.fsf@codeaurora.org>
 <19bf39e9-cee5-109f-d68f-5cbf576cc871@dd-wrt.com>
Date: Mon, 08 Jun 2020 14:12:17 +0300
In-Reply-To: <19bf39e9-cee5-109f-d68f-5cbf576cc871@dd-wrt.com> (Sebastian
 Gottschall's message of "Sat, 30 May 2020 09:26:12 +0200")
Message-ID: <87blltke0e.fsf@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath10k@lists.infradead.org

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

>> Yeah, that patch is buggy but this should fix it:
>>
>> commit 32221df6765b3773ff1af37c77f8531ebc48f246
>> Author:     Arnd Bergmann <arnd@arndb.de>
>> AuthorDate: Sat May 9 14:06:33 2020 +0200
>> Commit:     Kalle Valo <kvalo@codeaurora.org>
>> CommitDate: Tue May 12 10:33:13 2020 +0300
>>
>>      ath10k: fix ath10k_pci struct layout
> this patch seem to be totally unrelated to the crash issue, the patch
> was already part of the test tree while testing.
> the crash is caused by ar_pci->pipe_config beeing NULL on ipq4019 chipsets.
> originally pipe_config is allocated by ath10k_pci_probe. but
> ath10k_pci_probe is never used for ahb chipsets
> so the code must fix ath10k_ahb_probe to allocate these fields, or a
> more generic solution must be found

Maharaja, please investigate. It seems your patch caused a regression:

521fc37be3d8 ath10k: Avoid override CE5 configuration for QCA99X0 chipsets

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
