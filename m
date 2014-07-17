Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7mQf-0007h1-9i
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 14:13:03 +0000
Received: by mail-ie0-f174.google.com with SMTP id rp18so2976296iec.33
 for <ath10k@lists.infradead.org>; Thu, 17 Jul 2014 07:12:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53C59A22.6000505@marcant.net>
References: <53AD2EEE.4040704@marcant.net>
 <87tx70p4e0.fsf@kamboji.qca.qualcomm.com>
 <CAGXE3d-i1Cf93cTuM=gSPttOBsCrP1c_Hb0=XDi8mXsZBm-MUQ@mail.gmail.com>
 <53C59A22.6000505@marcant.net>
Date: Thu, 17 Jul 2014 16:12:35 +0200
Message-ID: <CAGXE3d8KZ=BG6a2PBhY_ZAhf71admtrnCF01LNoyA2tnLNJcAA@mail.gmail.com>
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
To: Andre Valentin <avalentin@marcant.net>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

Hey,

On Tue, Jul 15, 2014 at 11:16 PM, Andre Valentin <avalentin@marcant.net> wrote:
> Hi!
>
> Somehow I did not see this message. Sorry.

No problem.

>>>> If I remove OTP loading the card initializes fine, but I think I will
>>>>
>>>> not have a good performance. So bad idea.
>>>
>>>
>>> All that was changed recently was that we now check the error code
>>> coming from otp.bin. So you have had this issue all along, it was just
>>> hidden before.
>>
>>
>> Same issue here.
>>
>> Is it correct that board.bin should contain the calibration data of
>> the actual board?
>> I tried copying it from the APs ART partition but still no luck.
>>
>> Any hint on how to debug further why the otp calibration fails?
>
>
> I have no idea except disabling the error return inside of ath10k_pci.
> Would that make sense as a temporary workaround? It seems I have normal
> performance without enfording otp loading.

Sure, but it is a workaround and I'd like to find out why it fails if I use the
calibration data from the original firmware.

Thanks,
Helmut

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
