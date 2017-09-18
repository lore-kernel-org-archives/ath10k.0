Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dtxj7-0000QZ-CI
 for ath10k@lists.infradead.org; Mon, 18 Sep 2017 15:12:51 +0000
Received: by mail-wm0-x229.google.com with SMTP id g206so3675337wme.0
 for <ath10k@lists.infradead.org>; Mon, 18 Sep 2017 08:12:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87377kdoya.fsf@kamboji.qca.qualcomm.com>
References: <ba581279-8a7b-c38d-fa91-b4a85dd80b15@hauke-m.de>
 <87377kdoya.fsf@kamboji.qca.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Mon, 18 Sep 2017 08:12:24 -0700
Message-ID: <CAJ-Vmonc=VoV3JWbGABwC7kW-_qmk3qokyQV4Wg6wLcVVx+KZg@mail.gmail.com>
Subject: Re: QCA988X: FW firmware-5.bin_10.2.4.70.63-2 crashes at ath10k load
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
Cc: Hauke Mehrtens <hauke@hauke-m.de>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

heh,


On 18 September 2017 at 08:08, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Hauke Mehrtens <hauke@hauke-m.de> writes:
>
>> I am using a BT Home Hub 5A with LEDE and backports-4.14-rc1 + some
>> patches from the LEDE repository. It has one QCA988X card in it which
>> works like expected with FW firmware-5.bin_10.2.4-1.0-00029, but crashes
>> with FW firmware-5.bin_10.2.4.70.63-2.
>
> Thanks for the report. I have been waiting for a fix from the firmware
> team but I now reverted the broken release from both ath10k-firmware and
> linux-firmware:

Cool. Just note that if someone comes along and says "oh I have
QCA9880 and the latest firmware, and it's some board that was
calibrated very recently, but the transmit power is really low /
receive is really deaf", they should try the recent firmware. :-)



-adrian

>
> https://github.com/kvalo/ath10k-firmware/commit/a70d26758a9ad7cf81ebf2e7bf4383c50a5ea5ae
>
> https://lkml.kernel.org/r/1505746857-31938-4-git-send-email-kvalo@qca.qualcomm.com
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
