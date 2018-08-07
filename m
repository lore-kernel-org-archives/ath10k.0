Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmu7r-0008NZ-28
 for ath10k@lists.infradead.org; Tue, 07 Aug 2018 05:01:44 +0000
Received: by mail-lj1-x230.google.com with SMTP id f1-v6so12331830ljc.9
 for <ath10k@lists.infradead.org>; Mon, 06 Aug 2018 22:01:32 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id u10-v6sm57075ljk.83.2018.08.06.22.01.28
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Aug 2018 22:01:29 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id b22-v6so10702705lfa.3
 for <ath10k@lists.infradead.org>; Mon, 06 Aug 2018 22:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180807020813.GA185137@ban.mtv.corp.google.com>
 <ff8b15d6-7020-854d-4bc8-d7b1194e2407@dd-wrt.com>
In-Reply-To: <ff8b15d6-7020-854d-4bc8-d7b1194e2407@dd-wrt.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 6 Aug 2018 22:01:16 -0700
Message-ID: <CA+ASDXMwpaS93C_7pHzJGoaZZm7b_BSQkpGgngUuT7ney70vEw@mail.gmail.com>
Subject: Re: ath10k: antenna bitmask support?
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
To: s.gottschall@dd-wrt.com
Cc: greearb@candelatech.com, ath10k@lists.infradead.org

Hi Sebastian,

On Mon, Aug 6, 2018 at 9:11 PM Sebastian Gottschall
<s.gottschall@dd-wrt.com> wrote:
>
> Am 07.08.2018 um 04:08 schrieb Brian Norris:
...
> > Is it really expected that you can set gaps in the chainmask or not? I
> > ask because I've been trying to use this for doing some antenna
> > configuration verification (e.g., disable all but one antenna and see
> > what happens), and this works as expected on APs I have running IPQ8064
> > (QCA988X?), but it crashes the firmware on IPQ4019.
...
> from what i know, gaps will not work. so valid masks are only like 0x1,
> 0x3, 0x7, 0xf. so same behaviour as for ath9k

Thanks for your response. The thing is, masks like 0x2 and 0x4 *do*
appear to work for IPQ8064, as I noted above. Let me elaborate.

I tested with a conductively-wired setup, where antennas are wired
directly from an AP to a client (with reasonable attenuation), only 2
of the 3 AP antennas are connected, and the client supports reporting
signal strength on a per-antenna basis. If I set the AP's mask to 0x1,
I see strong signal only on the client's antenna 1; if set to 0x2, I
see strong signal only on the client's antenna 2; and if I set it to
0x4, I see only a very weak signal (presumably over the air, even
without any antenna).

In other words, I think this clearly works for some chipsets. I just
wonder if anybody knows anything about why it does or doesn't work on
a give chipset.

I also acknowledge that while the firmware may work properly, ath10k
may not always account for this properly (hence, proposals like the
diff in the previous email). I see several occasions where ath10k does
a simple integer greater/less-than comparison between 1 and
cfg_{tx,rx}_chainmask, which seems wrong. But my question is more
geared toward firmware and hardware support; fixing drivers is
relatively easy ;)

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
