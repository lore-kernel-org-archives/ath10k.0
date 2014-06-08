Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtW9T-0005y6-55
 for ath10k@lists.infradead.org; Sun, 08 Jun 2014 06:00:19 +0000
Received: by mail-ig0-f178.google.com with SMTP id hn18so52213igb.5
 for <ath10k@lists.infradead.org>; Sat, 07 Jun 2014 22:59:57 -0700 (PDT)
Received: from [192.168.1.78]
 (162-232-170-116.lightspeed.sntcca.sbcglobal.net. [162.232.170.116])
 by mx.google.com with ESMTPSA id ky8sm56208710pbc.64.2014.06.07.22.59.55
 for <ath10k@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Sat, 07 Jun 2014 22:59:56 -0700 (PDT)
Message-ID: <5393FBDA.9060009@gmail.com>
Date: Sat, 07 Jun 2014 22:59:54 -0700
From: Kamal Koshy <kamal.koshy@gmail.com>
MIME-Version: 1.0
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <CALCETrU=8+tnptdfva4p27nA-5=E31DwXagoLqUxYcLtEKrB+w@mail.gmail.com>
 <CA+BoTQmUyvTr+ga81EacbMkE4UVtMBP2PfBs_vH-PF4OvHuZQg@mail.gmail.com>
 <53905134.8010303@stackframe.org> <87tx7zoafw.fsf@kamboji.qca.qualcomm.com>
 <5390594F.4070801@stackframe.org>
 <CA+BoTQ=QCNcbWmhEd1vyXDZY1yy0yvz_VSFqnOzOzYGMyxjGJw@mail.gmail.com>
 <5393781C.8090403@stackframe.org> <53937902.1030309@stackframe.org>
In-Reply-To: <53937902.1030309@stackframe.org>
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

The MAC address of the devices (for the calibration data) are as follows

1. 2.4 GHz radio - E8-94-F6-91-3B-53
2. 5 GHz radio - E8-94-F6-91-3B-52

This is with the original TPLink firmware.
Thanks
Kamal


On 06/07/2014 01:41 PM, Sven Schnelle wrote:
>
> Am 07.06.2014 22:37, schrieb Sven Schnelle:
>>
>> Just to be sure, here are the md5sums of the firmware files i'm using:
>> [...]
> Crap, pasted the wrong output. The firmware/kernel log was generated 
> with these files:
>> 419d73569cb0effc0a8b380f8e4dd197 
>> /lib/firmware/ath10k/QCA988X/hw2.0/board.bin
>> 13385cef5d83c3fa96dfaaeb69c155d9 
>> /lib/firmware/ath10k/QCA988X/hw2.0/firmware-2.bin
>> 3c2251c94974367c170e90030ca04f99 
>> /lib/firmware/ath10k/QCA988X/hw2.0/utf.bin
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
