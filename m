Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7nEI-0003NM-CC
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 15:04:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k OTP loading issues
References: <53AD2EEE.4040704@marcant.net>
 <87tx70p4e0.fsf@kamboji.qca.qualcomm.com>
 <CAGXE3d-i1Cf93cTuM=gSPttOBsCrP1c_Hb0=XDi8mXsZBm-MUQ@mail.gmail.com>
 <53C59A22.6000505@marcant.net>
 <CAGXE3d8KZ=BG6a2PBhY_ZAhf71admtrnCF01LNoyA2tnLNJcAA@mail.gmail.com>
Date: Thu, 17 Jul 2014 18:03:52 +0300
In-Reply-To: <CAGXE3d8KZ=BG6a2PBhY_ZAhf71admtrnCF01LNoyA2tnLNJcAA@mail.gmail.com>
 (Helmut Schaa's message of "Thu, 17 Jul 2014 16:12:35 +0200")
Message-ID: <87wqbc6n8n.fsf@kamboji.qca.qualcomm.com>
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
To: Helmut Schaa <helmut.schaa@googlemail.com>
Cc: Andre Valentin <avalentin@marcant.net>, ath10k@lists.infradead.org

Helmut Schaa <helmut.schaa@googlemail.com> writes:

>>> Is it correct that board.bin should contain the calibration data of
>>> the actual board? I tried copying it from the APs ART partition but
>>> still no luck.
>>>
>>> Any hint on how to debug further why the otp calibration fails?
>>
>> I have no idea except disabling the error return inside of ath10k_pci.
>> Would that make sense as a temporary workaround? It seems I have normal
>> performance without enfording otp loading.
>
> Sure, but it is a workaround and I'd like to find out why it fails if I use the
> calibration data from the original firmware.

Let me clarify. There are two ways to store the calibration data:

1) to the OTP area within the QCA9880 chip

2) to the host, for example to an MTD partition

otp.bin is used with method 1). It reads the OTP area and provides the
calibration data to the firmware.

But in method 2) otp.bin will fail as there's no data in the OTP area.
This is expected and that's why we should not run otp.bin at all with
method 2).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
