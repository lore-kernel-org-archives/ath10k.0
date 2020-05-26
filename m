Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.as201155.net ([185.84.6.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdbWU-0007bH-Py
 for ath10k@lists.infradead.org; Tue, 26 May 2020 15:29:48 +0000
Subject: Re: [PATCH] ath10k: Avoid override CE5 configuration for QCA99X0
 chipsets
References: <1587649759-14381-1-git-send-email-mkenna@codeaurora.org>
 <20200505073422.BFA51C433BA@smtp.codeaurora.org>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <63ec6f30-ee3b-c412-7c56-46d447b17c8e@dd-wrt.com>
Date: Tue, 26 May 2020 17:29:24 +0200
MIME-Version: 1.0
In-Reply-To: <20200505073422.BFA51C433BA@smtp.codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Am 05.05.2020 um 09:34 schrieb Kalle Valo:

> Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:
>
>> As the exisiting CE configurations are defined in global, there
>> are the chances of QCA99X0 family chipsets CE configurations
>> are getting changed by the ath10k_pci_override_ce_config()
>> function.
>>
>> The override will be hit and CE5 configurations will be changed,
>> when the user bring up the QCA99X0 chipsets along with QCA6174
>> or QCA9377 chipset. (Bring up QCA99X0 family chipsets after
>> QCA6174 or QCA9377).
>>
>> Hence, fixing this issue by moving the global CE configuration
>> to radio specific CE configuration.
>>
>> Tested hardware: QCA9888 & QCA6174
>> Tested firmware: 10.4-3.10-00047 & WLAN.RM.4.4.1.c3-00058
>>
>> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> Patch applied to ath-next branch of ath.git, thanks.
>
> 521fc37be3d8 ath10k: Avoid override CE5 configuration for QCA99X0 chipsets
this patch will crash on ipq4019 devices. i reverted it and it worked again

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
