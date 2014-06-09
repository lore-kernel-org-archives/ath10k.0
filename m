Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wu0k2-0002y8-7L
 for ath10k@lists.infradead.org; Mon, 09 Jun 2014 14:40:07 +0000
Received: by mail-pb0-f54.google.com with SMTP id jt11so5032165pbb.27
 for <ath10k@lists.infradead.org>; Mon, 09 Jun 2014 07:39:44 -0700 (PDT)
Received: from [192.168.1.78]
 (162-232-170-116.lightspeed.sntcca.sbcglobal.net. [162.232.170.116])
 by mx.google.com with ESMTPSA id ys1sm13384429pab.7.2014.06.09.07.39.43
 for <ath10k@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Mon, 09 Jun 2014 07:39:43 -0700 (PDT)
Message-ID: <5395C72E.2030608@gmail.com>
Date: Mon, 09 Jun 2014 07:39:42 -0700
From: Kamal Koshy <kamal.koshy@gmail.com>
MIME-Version: 1.0
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <5392AD19.3060103@stackframe.org> <53944E64.9000002@elisanet.fi>
 <87lht6h4gi.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87lht6h4gi.fsf@kamboji.qca.qualcomm.com>
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

Michal, Kalle
I tried with the board file extracted from 0x5800-0x5843 (MD5 sum 
0a0a9104555f857285b82b7f62b98440). This does not make a difference. 
However, did not skip the OTP file, since I did not know how to do it. I 
can try skipping the OTP file, if I can get the procedure.
Kamal

On 06/09/2014 01:28 AM, Kalle Valo wrote:
> Matti Laakso <malaakso@elisanet.fi> writes:
>
>>> ------------------------------------------------------------------------
>>> Hi Kalle,
>>>
>>> Am 07.06.2014 07:36, schrieb Kalle Valo:
>>>> / Kamal Koshy <kamal.koshy at gmail.com <http://lists.infradead.org/mailman/listinfo/ath10k>> writes:
>>> />/
>>> />>/ Attaching the result of dd if=/dev/mtd4 > ~/mtd4
>>> />/ Thanks, I'll take a look at that later. But before that, do you know
>>> />/ what's the mac address of the QCA9880 device with the proprietary
>>> />/ driver? (_not_ with ath10k) That would help searching for the
>>> />/ calibration data.
>>> />/
>>> /To me it looks like ath9k calibration data starts at 0x1000, and ath10k
>>> calibration data
>>> starts at 0x5000 in that mtd image. That's the same as on my board.
>>>
>>> Sven
>>>
>> Yeah, that's definitely the case.
>>
>> I think we need something like this for ath10k:
>>
>> https://github.com/kvalo/ath/blob/master/include/linux/ath9k_platform.h
>>
>> which we can then populate in the mach-file.
> Yeah, we need that. But before that an ugly workaround is to do what
> Michal suggests (copy the content to board.bin and skip otp.bin
> execution in ath10k).
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
