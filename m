Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erLDF-00023f-EA
 for ath10k@lists.infradead.org; Thu, 01 Mar 2018 10:14:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: search all IEs for variant before falling back
Date: Thu, 1 Mar 2018 10:13:05 +0000
Message-ID: <87tvu0p0i7.fsf@kamboji.qca.qualcomm.com>
References: <d121031bd5eacf212f7ddf49c0440218714f1ae6.1519231419.git.tommyhebb@gmail.com>
 <87y3jcp0kz.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87y3jcp0kz.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Thu, 01 Mar 2018 12:11:24 +0200")
Content-Language: en-US
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
To: Thomas Hebb <tommyhebb@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@codeaurora.org> writes:

> Thomas Hebb <tommyhebb@gmail.com> writes:
>
>> commit f2593cb1b291 ("ath10k: Search SMBIOS for OEM board file
>> extension") added a feature to ath10k that allows Board Data File
>> (BDF) conflicts between multiple devices that use the same device IDs
>> but have different calibration requirements to be resolved by allowing
>> a "variant" string to be stored in SMBIOS [and later device tree, added
>> by commit d06f26c5c8a4 ("ath10k: search DT for qcom,ath10k-calibration-
>> variant")] that gets appended to the ID stored in board-2.bin.
>>
>> This original patch had a regression, however. Namely that devices with
>> a variant present in SMBIOS that didn't need custom BDFs could no longer
>> find the default BDF, which has no variant appended. The patch was
>> reverted and re-applied with a fix for this issue in commit 1657b8f84ed9
>> ("search SMBIOS for OEM board file extension").
>>
>> But the fix to fall back to a default BDF introduced another issue: the
>> driver currently parses IEs in board-2.bin one by one, and for each one
>> it first checks to see if it matches the ID with the variant appended.
>> If it doesn't, it checks to see if it matches the "fallback" ID with no
>> variant. If a matching BDF is found at any point during this search, the
>> search is terminated and that BDF is used. The issue is that it's very
>> possible (and is currently the case for board-2.bin files present in the
>> ath10k-firmware repository) for the default BDF to occur in an earlier
>> IE than the variant-specific BDF. In this case, the current code will
>> happily choose the default BDF even though a better-matching BDF is
>> present later in the file.
>>
>> This patch fixes the issue by first searching the entire file for the ID
>> with variant, and searching for the fallback ID only if that search
>> fails. It also includes some code cleanup in the area, as
>> ath10k_core_fetch_board_data_api_n() no longer does its own string
>> mangling to remove the variant from an ID, instead leaving that job to a
>> new flag passed to ath10k_core_create_board_name().
>>
>> I've tested this patch on a QCA4019 and verified that the driver behaves
>> correctly for 1) both fallback and variant BDFs present, 2) only fallback
>> BDF present, and 3) no matching BDFs present.
>>
>> Fixes: 1657b8f84ed9 ("ath10k: search SMBIOS for OEM board file extension")
>> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
>
> BTW, you forgot to CC linux-wireless so I don't see this in patchwork.
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches

Oh, and I haven't had a chance to review this yet but I'll try to do
that soon.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
