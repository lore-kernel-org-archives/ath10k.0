Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fn6IS-00016G-Nj
 for ath10k@lists.infradead.org; Tue, 07 Aug 2018 18:01:31 +0000
Received: by mail-pf1-x443.google.com with SMTP id j26-v6so8938038pfi.10
 for <ath10k@lists.infradead.org>; Tue, 07 Aug 2018 11:01:18 -0700 (PDT)
Date: Tue, 7 Aug 2018 11:01:14 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: ath10k: antenna bitmask support?
Message-ID: <20180807180051.GB163107@ban.mtv.corp.google.com>
References: <20180807020813.GA185137@ban.mtv.corp.google.com>
 <ff8b15d6-7020-854d-4bc8-d7b1194e2407@dd-wrt.com>
 <CA+ASDXMwpaS93C_7pHzJGoaZZm7b_BSQkpGgngUuT7ney70vEw@mail.gmail.com>
 <cd1f2332-44fa-917f-2a72-3bc52757e109@dd-wrt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd1f2332-44fa-917f-2a72-3bc52757e109@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: greearb@candelatech.com, ath10k@lists.infradead.org

Hi Sebastian,

On Tue, Aug 07, 2018 at 09:22:31AM +0200, Sebastian Gottschall wrote:
> Am 07.08.2018 um 07:01 schrieb Brian Norris:
> > Thanks for your response. The thing is, masks like 0x2 and 0x4 *do*
> > appear to work for IPQ8064, as I noted above. Let me elaborate.
> > 
> > I tested with a conductively-wired setup, where antennas are wired
> > directly from an AP to a client (with reasonable attenuation), only 2
> > of the 3 AP antennas are connected, and the client supports reporting
> > signal strength on a per-antenna basis. If I set the AP's mask to 0x1,
> > I see strong signal only on the client's antenna 1; if set to 0x2, I
> > see strong signal only on the client's antenna 2; and if I set it to
> > 0x4, I see only a very weak signal (presumably over the air, even
> > without any antenna).
> > 
> > In other words, I think this clearly works for some chipsets. I just
> > wonder if anybody knows anything about why it does or doesn't work on
> > a give chipset.
> i dont think so. even if you see a signal on it i'm pretty sure that the
> rate control algorithm within the firmware
> will simply fail and gets out of control due the way the rate control
> algorithm works and handles the chain controls.
> depending on the rate the rate control algorithm will select chains to
> transmit. so i assume if you set it to 0x2, all rates
> which are supported by 1x1 only, will not work anymore. so 1x1 clients
> simply wont work anymore.
> and then there are several other cases like vht160, which always uses chain
> 1 and 2 even if 4x4 is selected. so if you configure
> such a setup i expect nothing more than a crash in the firmware on 9984
> chipsets for instance
> but of course these are assumptions from the firmware code i know and no
> proof.

Thank you for the much more detailed information. For the record, I was
testing a 2x2 client with some moderate test traffic, and stuff
appeared to work, settling on the appropriate NSS=1 or NSS=2 rates
according to how many antennas I configured. I didn't gauge throughput
or anything like that, nor did I try a 1x1 client.

So it seems like to some extent things "may" work, but there are a lot
of known firmware deficiencies. In some cases, this is enough for
certain debugging or verification scenarios but likely not good for any
sort of "real" use case. I'm torn between whether we should just reject
these configurations outright, or leave the status quo: log a warning
but don't reject.

I guess I'll personally just leave things along and note these
limitations for myself.

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
