Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJg36-0004WB-Fg
 for ath10k@lists.infradead.org; Thu, 14 Jan 2016 11:26:41 +0000
From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Subject: Re: Re:
Date: Thu, 14 Jan 2016 11:26:11 +0000
Message-ID: <1452770769631.95608@qti.qualcomm.com>
References: <CAGvpMW8JW+a6-MS=TrRNFvBDG4LWYFR+2fM09dFhQEes7NEn4w@mail.gmail.com>
 <CA+BoTQk313y4GA-yq01LBad8ccf2OepU6vP_t7PjAJ1a1DR_7Q@mail.gmail.com>
 <CAGvpMW9d8RZGpfBd2H0W35fVUQoi9jcZvQmTC7ztW+dPVcxOhg@mail.gmail.com>
 <CA+BoTQk7O4Lq2rcZG9pLZJij27COWiCUz=g8SNEp2df3CKV-vg@mail.gmail.com>
 <CAGvpMW_wSfe8m+WtwhS0aRj8o0MioPi2o2FKZ3Vjk7ei-x7iOw@mail.gmail.com>
 <CA+BoTQ=OtLnfmas=TYOdTOTEtkeoaxd7BuT5O7ircpd+oMecgw@mail.gmail.com>
 <CAGvpMW9mYhyoHZq+Lt1jCkowEiKuKH2_4Vqm+37Y4nK_W-1R+Q@mail.gmail.com>
 <CA+BoTQn0ia0tF4QXM+L4gu2GLmeAatMrWsLADe57L9j=yun8QA@mail.gmail.com>,
 <CAGvpMW9YEZdXTMkg7UdGqrKqUtu0i+LFAO7GCyVmWLJUi+W_ZQ@mail.gmail.com>
In-Reply-To: <CAGvpMW9YEZdXTMkg7UdGqrKqUtu0i+LFAO7GCyVmWLJUi+W_ZQ@mail.gmail.com>
Content-Language: en-IN
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Alexey Ivanov <alexeyivan@gmail.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Alex,

not sure this thread might be useful to you
https://lists.openwrt.org/pipermail/openwrt-devel/2015-June/033894.html

if the script is part of preinit and create .bin files, it will executed be=
fore wifi comes up.

regards
shafi
________________________________________
From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Alexey Ivano=
v <alexeyivan@gmail.com>
Sent: 14 January 2016 16:44
To: michal.kazior@tieto.com
Cc: ath10k@lists.infradead.org
Subject: Re:

OK, Micha=B3
Thank you,

I found preinit scripts. some of them do ifconfig and some
do patching of the default mac in firmware.bin

On 14 January 2016 at 11:21, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 14 January 2016 at 06:36, Alexey Ivanov <alexeyivan@gmail.com> wrote:
>> Yes, you're right, Micha=B3
>> putting cal.bin to lib/firmware/ath10k helped
>> (before I put it to lib/firmware/ath10k/QCA988X/hw2.0/)
>>
>> but the mac address is still 00:03:7F:00:00:00
>>
>> the output now is:
>> [   11.381198] ath10k_pci 0000:00:00.0: pci irq legacy interrupts 0
>> irq_mode 0 reset_mode 0
>> [   11.725833] ath10k_pci 0000:00:00.0: qca988x hw2.0 target
>> 0x4100016c chip_id 0x043202ff sub 0000:0000
>> [   11.735226] ath10k_pci 0000:00:00.0: kconfig debug 1 debugfs 1
>> tracing 0 dfs 0 testmode 1
>> [   11.748288] ath10k_pci 0000:00:00.0: firmware ver 10.2.4.97 api 5
>> features no-p2p crc32 f91e34f2
>> [   11.797377] ath10k_pci 0000:00:00.0: Direct firmware load for
>> ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
>> [   11.807985] ath10k_pci 0000:00:00.0: Falling back to user helper
>> [   11.882960] firmware ath10k!QCA988X!hw2.0!board-2.bin:
>> firmware_loading_store: map pages failed
>> [   11.893044] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A
>> crc32 e623b3be
>> [   12.947352] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 5 htt-op 2
>> cal file max-sta 128 raw 0 hwcrypto 1
>>
>> As I understand, after correct calibration there should be normal mac?
>
> Not necessarily. I think some routers have mac addresses elsewhere. If
> you look at OpenWRT scripts you should probably find a few
> scripts/hacks that put it in board.bin (the reason for the filename is
> that at the time cal.bin support wasn't in ath10k yet).
>
>
> Micha=B3



--
Best regards,
Alex Ivanov

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
