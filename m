Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cXwFX-0004js-2z
 for ath10k@lists.infradead.org; Sun, 29 Jan 2017 20:39:01 +0000
Received: by mail-wm0-f43.google.com with SMTP id r141so6303967wmg.1
 for <ath10k@lists.infradead.org>; Sun, 29 Jan 2017 12:38:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170129104829.GA3440@lichtkranz.fritz.box>
References: <20170129104829.GA3440@lichtkranz.fritz.box>
From: Adrian Chadd <adrian@freebsd.org>
Date: Sun, 29 Jan 2017 12:37:35 -0800
Message-ID: <CAJ-VmokDYHg8UJLq7LadWFeN_B2wFj3LLVj=FifWzzvT3k8o_A@mail.gmail.com>
Subject: Re: Recent driver changes destabilized QCA9377 connection quality
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
To: Tobias Predel <tobias.predel@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

hiya,

which version(s) of firmware are involved?

Which version of linux/backports works versus doesn't work?


-a


On 29 January 2017 at 02:48, Tobias Predel <tobias.predel@gmail.com> wrote:
> Hello,
>
> I just want to report a negative development I have been experiencing for a week now.
>
> Recent changes in ath10k driver code seem to destabilize QCA9377 connection quality in 802.11b/g networks, as hardware and software configuration (wpa_supplicant) hasn't changed. Before, I have managed to have a fair connection quality for around three months. At the moment I encounter multiple connection losses.
>
> dmesg reports usual losses and timeouts on both linux-lts 4.4.44 and linux 4.8.13 (Arch Linux).
>
> Please restore former functionality.
>
> Sincerely yours,
>
> Tobias Predel
> --
> Tobias Predel
> currently studying Transportation engineering B.Sc.
> at Stuttgart University
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
