Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bUYXP-0000yq-Rw
 for ath10k@lists.infradead.org; Tue, 02 Aug 2016 12:11:13 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: ath10k fail to load firmware
Date: Tue, 2 Aug 2016 12:10:46 +0000
Message-ID: <87eg6774my.fsf@kamboji.qca.qualcomm.com>
References: <20160719070932.GA2751@redhat.com>
 <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
In-Reply-To: <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>	(Michal
 Kazior's message of "Tue, 19 Jul 2016 09:18:01 +0200")
Content-Language: en-US
Content-ID: <D6A64D898EED7748AA0775632087F3D5@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, "perry_yuan@dell.com" <perry_yuan@dell.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 19 July 2016 at 09:09, Stanislaw Gruszka <sgruszka@redhat.com> wrote:
>> Perry from Dell has ath10k device, which do not work with current
>> linux-firmware. It's on RHEL kernel, however wirelss stack and drivers
>> are from 4.7-rc1 (I did not update to 4.7 final yet, since I do not see
>> ath10k fix, which could possibly help here). Partial dmesg is in
>> the attachment.
>
> hw.3 qca6174 chips tend to require very specific board data for proper
> calibration.
>
>   [ 3838.601884] ath10k_pci 0000:01:00.0: failed to fetch board data
> for bus=pci,vendor=168c,device=003e,subsystem-vendor=1028,subsystem-device=0310
> from ath10k/QCA6174/hw3.0/board-2.bin
>   [ 3838.601920] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A
> crc32 ed5f849a
>
> Your board-2.bin doesn't contain the matching board data and the
> driver then falls back to the older board API1 which is pretty much
> doomed to fail on qca6174 hw.3.
>
> @Kalle: Perhaps ath10k needs to fail early with an adequate message
> for qca6174 hw.3 if board API2 lookup fails (e.g. hw_params flag
> because this seems to be quite closely coupled with hardware itself).

Sounds like a good idea. Or maybe we should always fail when using
board-2.bin (no matter what hw version is used)? Dunno.

> @Stanislaw: You either need to grab a more recent board-2.bin
> (https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0),
> ask Kalle & wait, or cook up your own (if you really need it working
> *now*) by getting Windows driver and dissecting it (the .inf file
> contains enough information for you to map board data also referred to
> as eeprom-something in the Windows blob).

I pushed a new board-2.bin:

https://github.com/kvalo/ath10k-firmware/commit/7c0411643b195b246d3871f409f9219f528b39c1

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
