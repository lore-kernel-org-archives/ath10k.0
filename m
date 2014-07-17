Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7nsp-0005T6-Sz
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 15:46:13 +0000
Received: by mail-ie0-f171.google.com with SMTP id at1so3183841iec.16
 for <ath10k@lists.infradead.org>; Thu, 17 Jul 2014 08:45:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87wqbc6n8n.fsf@kamboji.qca.qualcomm.com>
References: <53AD2EEE.4040704@marcant.net>
 <87tx70p4e0.fsf@kamboji.qca.qualcomm.com>
 <CAGXE3d-i1Cf93cTuM=gSPttOBsCrP1c_Hb0=XDi8mXsZBm-MUQ@mail.gmail.com>
 <53C59A22.6000505@marcant.net>
 <CAGXE3d8KZ=BG6a2PBhY_ZAhf71admtrnCF01LNoyA2tnLNJcAA@mail.gmail.com>
 <87wqbc6n8n.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 17 Jul 2014 17:45:46 +0200
Message-ID: <CAGXE3d_FQvvmkGajQ1ioU5mEL04xVzUQ1k9-uXSLjoDFX+Z-Cg@mail.gmail.com>
Subject: Re: ath10k OTP loading issues
From: Helmut Schaa <helmut.schaa@googlemail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Andre Valentin <avalentin@marcant.net>, ath10k@lists.infradead.org

On Thu, Jul 17, 2014 at 5:03 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Helmut Schaa <helmut.schaa@googlemail.com> writes:
>
>>>> Is it correct that board.bin should contain the calibration data of
>>>> the actual board? I tried copying it from the APs ART partition but
>>>> still no luck.
>>>>
>>>> Any hint on how to debug further why the otp calibration fails?
>>>
>>> I have no idea except disabling the error return inside of ath10k_pci.
>>> Would that make sense as a temporary workaround? It seems I have normal
>>> performance without enfording otp loading.
>>
>> Sure, but it is a workaround and I'd like to find out why it fails if I use the
>> calibration data from the original firmware.
>
> Let me clarify. There are two ways to store the calibration data:
>
> 1) to the OTP area within the QCA9880 chip
>
> 2) to the host, for example to an MTD partition
>
> otp.bin is used with method 1). It reads the OTP area and provides the
> calibration data to the firmware.
>
> But in method 2) otp.bin will fail as there's no data in the OTP area.
> This is expected and that's why we should not run otp.bin at all with
> method 2).

Thanks for clarification Kalle!
So, method 2 requires only a board.bin?

Helmut

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
