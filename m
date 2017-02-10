Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0030.hostedemail.com ([216.40.44.30]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cc5ls-0000PI-27
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 07:37:35 +0000
Message-ID: <1486712222.2192.3.camel@perches.com>
Subject: Re: [PATCH 1/3] ath10k: remove ath10k_vif_to_arvif()
From: Joe Perches <joe@perches.com>
Date: Thu, 09 Feb 2017 23:37:02 -0800
In-Reply-To: <CAJ-Vmom7k3Tsgs8tRHQppmL7XxADS3V24AGOQY5QgkrSgr5Qzg@mail.gmail.com>
References: <1486030773-30600-1-git-send-email-amadeusz.slawinski@tieto.com>
 <CAJ-VmonrHpS3MArM9ohHgLvb6xspP_gnVVeJWA9F-pjUpJ+LZA@mail.gmail.com>
 <87y3xi4b28.fsf@qca.qualcomm.com> <5899DDD7.7000605@candelatech.com>
 <87tw82il32.fsf@kamboji.qca.qualcomm.com>
 <CAJ-Vmom7k3Tsgs8tRHQppmL7XxADS3V24AGOQY5QgkrSgr5Qzg@mail.gmail.com>
Mime-Version: 1.0
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
To: Adrian Chadd <adrian@freebsd.org>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?= <amadeusz.slawinski@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Greear <greearb@candelatech.com>

On Thu, 2017-02-09 at 23:14 -0800, Adrian Chadd wrote:

> If there
> were accessors for the skb data / len fields (like we do for mbufs)
> then porting the code would've involved about 5,000 less changed
> lines.

What generic mechanisms would you suggest to make
porting easier between bsd and linux and what in
your opinion are the best naming schemes to make
these functions easiest to read and implement
without resorting to excessive identifier lengths?

If you have some, please provide examples.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
