Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8nmU-0005t9-8O
 for ath10k@lists.infradead.org; Wed, 07 Jan 2015 10:24:02 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21677.2491.857663.473071@gargle.gargle.HOWL>
Date: Wed, 7 Jan 2015 15:56:03 +0530
Subject: Re: [PATCH] ath10k: Fix DMA burst size
In-Reply-To: <CA+BoTQ=Vt8BTzZcgxqq4eU+RKhMwNbGrZOOFGL9TcBA3KnrerQ@mail.gmail.com>
References: <1419834066-11802-1-git-send-email-sujith@msujith.org>
 <CA+BoTQ=Vt8BTzZcgxqq4eU+RKhMwNbGrZOOFGL9TcBA3KnrerQ@mail.gmail.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior wrote:
> Since it's for cards/chips why do you enable it for 10.2 only? There's
> 10.1, main and tlv as well which could possibly benefit from this.

I've not tested it with any of the FW versions other than 10.2 and
am not sure if older FW support this properly. We could try it
with 10.1, I guess - but even that is in 'maintenance mode'
internally.

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
