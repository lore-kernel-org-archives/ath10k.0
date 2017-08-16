Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22b.google.com ([2a00:1450:4010:c07::22b])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhzFK-00072n-Co
 for ath10k@lists.infradead.org; Wed, 16 Aug 2017 14:24:36 +0000
Received: by mail-lf0-x22b.google.com with SMTP id o85so17212268lff.3
 for <ath10k@lists.infradead.org>; Wed, 16 Aug 2017 07:24:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lgmj7g75.fsf@kamboji.qca.qualcomm.com>
References: <CAPYrjBWL8LmVyWcXRZZDE1pEpwq-E6vRh5Ed_kG=ieZfsZdeiA@mail.gmail.com>
 <87lgmj7g75.fsf@kamboji.qca.qualcomm.com>
From: Gilbert Moisio <gmoisio@gmail.com>
Date: Wed, 16 Aug 2017 16:24:11 +0200
Message-ID: <CAM8JFhD0qFeDnHywTXmsHSdp4dzWeL_by1a=a4btaMcCbibmEw@mail.gmail.com>
Subject: Re: ath10k firmware-6.bin bug: Disconnections every 20 minutes on
 QCA6174
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
Cc: Kouroche Bouchiat <kouroche.bouchiat@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, thanks for your answer.
I tried from a fresh install, directly with the last linux-firmware
package and the issue in avaliable at the first boot.
Regards

2017-08-16 16:14 GMT+02:00 Kalle Valo <kvalo@qca.qualcomm.com>:
> Kouroche Bouchiat <kouroche.bouchiat@gmail.com> writes:
>
>> On hw3.0/firmware-6.bin my QCA6174 seems to be dropping 100% of
>> packets after exactly 20 minutes. I talked to people over on the
>> Archlinux forums who suggested to force the kernel to load
>> firmware-4.bin instead. I did just that ("mv firmware-6.bin
>> firmware-6.bin.bak") and my connection seems to be working fine now.
>> The forum thread is the following:
>> https://bbs.archlinux.org/viewtopic.php?id=228793
>
> I suspect that this is a WPA rekeying problem, are you able to verify
> that? Anyway, I reported this internally.
>
> --
> Kalle Valo
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
