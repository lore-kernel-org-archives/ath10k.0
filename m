Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeh42-0003Lc-Fk
 for ath10k@lists.infradead.org; Fri, 29 May 2020 15:36:56 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Avoid override CE5 configuration for QCA99X0
 chipsets
References: <1587649759-14381-1-git-send-email-mkenna@codeaurora.org>
 <20200505073422.BFA51C433BA@smtp.codeaurora.org>
 <63ec6f30-ee3b-c412-7c56-46d447b17c8e@dd-wrt.com>
Date: Fri, 29 May 2020 18:36:48 +0300
In-Reply-To: <63ec6f30-ee3b-c412-7c56-46d447b17c8e@dd-wrt.com> (Sebastian
 Gottschall's message of "Tue, 26 May 2020 17:29:24 +0200")
Message-ID: <87ftbisqgf.fsf@codeaurora.org>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> Am 05.05.2020 um 09:34 schrieb Kalle Valo:
>
>> Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:
>>
>>> As the exisiting CE configurations are defined in global, there
>>> are the chances of QCA99X0 family chipsets CE configurations
>>> are getting changed by the ath10k_pci_override_ce_config()
>>> function.
>>>
>>> The override will be hit and CE5 configurations will be changed,
>>> when the user bring up the QCA99X0 chipsets along with QCA6174
>>> or QCA9377 chipset. (Bring up QCA99X0 family chipsets after
>>> QCA6174 or QCA9377).
>>>
>>> Hence, fixing this issue by moving the global CE configuration
>>> to radio specific CE configuration.
>>>
>>> Tested hardware: QCA9888 & QCA6174
>>> Tested firmware: 10.4-3.10-00047 & WLAN.RM.4.4.1.c3-00058
>>>
>>> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
>> Patch applied to ath-next branch of ath.git, thanks.
>>
>> 521fc37be3d8 ath10k: Avoid override CE5 configuration for QCA99X0 chipsets
>
> this patch will crash on ipq4019 devices. i reverted it and it worked again

Yeah, that patch is buggy but this should fix it:

commit 32221df6765b3773ff1af37c77f8531ebc48f246
Author:     Arnd Bergmann <arnd@arndb.de>
AuthorDate: Sat May 9 14:06:33 2020 +0200
Commit:     Kalle Valo <kvalo@codeaurora.org>
CommitDate: Tue May 12 10:33:13 2020 +0300

    ath10k: fix ath10k_pci struct layout

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
