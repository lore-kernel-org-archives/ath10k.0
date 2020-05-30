Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.as201155.net ([185.84.6.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jevsq-00041s-Jc
 for ath10k@lists.infradead.org; Sat, 30 May 2020 07:26:22 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:57275
 helo=webmail.newmedia-net.de)
 by mail.as201155.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1jevsj-0001Tq-36
 for ath10k@lists.infradead.org; Sat, 30 May 2020 09:26:14 +0200
Subject: Re: [PATCH] ath10k: Avoid override CE5 configuration for QCA99X0
 chipsets
References: <1587649759-14381-1-git-send-email-mkenna@codeaurora.org>
 <20200505073422.BFA51C433BA@smtp.codeaurora.org>
 <63ec6f30-ee3b-c412-7c56-46d447b17c8e@dd-wrt.com>
 <87ftbisqgf.fsf@codeaurora.org>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <19bf39e9-cee5-109f-d68f-5cbf576cc871@dd-wrt.com>
Date: Sat, 30 May 2020 09:26:12 +0200
MIME-Version: 1.0
In-Reply-To: <87ftbisqgf.fsf@codeaurora.org>
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
To: ath10k@lists.infradead.org

> Yeah, that patch is buggy but this should fix it:
>
> commit 32221df6765b3773ff1af37c77f8531ebc48f246
> Author:     Arnd Bergmann <arnd@arndb.de>
> AuthorDate: Sat May 9 14:06:33 2020 +0200
> Commit:     Kalle Valo <kvalo@codeaurora.org>
> CommitDate: Tue May 12 10:33:13 2020 +0300
>
>      ath10k: fix ath10k_pci struct layout
this patch seem to be totally unrelated to the crash issue, the patch 
was already part of the test tree while testing.
the crash is caused by ar_pci->pipe_config beeing NULL on ipq4019 chipsets.
originally pipe_config is allocated by ath10k_pci_probe. but 
ath10k_pci_probe is never used for ahb chipsets
so the code must fix ath10k_ahb_probe to allocate these fields, or a 
more generic solution must be found
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
