Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPPSG-00077I-69
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 07:28:37 +0000
Date: Tue, 19 Jul 2016 09:27:55 +0200
From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: Re: ath10k fail to load firmware
Message-ID: <20160719072754.GB2751@redhat.com>
References: <20160719070932.GA2751@redhat.com>
 <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, perry_yuan@dell.com, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Jul 19, 2016 at 09:18:01AM +0200, Michal Kazior wrote:
> On 19 July 2016 at 09:09, Stanislaw Gruszka <sgruszka@redhat.com> wrote:
> > Perry from Dell has ath10k device, which do not work with current
> > linux-firmware. It's on RHEL kernel, however wirelss stack and drivers
> > are from 4.7-rc1 (I did not update to 4.7 final yet, since I do not see
> > ath10k fix, which could possibly help here). Partial dmesg is in
> > the attachment.
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
> 
> @Stanislaw: You either need to grab a more recent board-2.bin
> (https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0),

@Perry, could you replace board-2.bin from above link on
/lib/firmware/ath10k/QCA6174/hw3.0/ and check if that work ?

> ask Kalle & wait, or cook up your own (if you really need it working
> *now*) by getting Windows driver and dissecting it (the .inf file
> contains enough information for you to map board data also referred to
> as eeprom-something in the Windows blob).

I think we can wait till firmware will be updated upstream, however
Dell would like to know if what we provide in new RHEL7 release
will work on their hardware.

Thanks
Stanislaw

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
