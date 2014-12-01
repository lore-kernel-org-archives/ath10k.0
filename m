Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvUXs-0007Yp-OL
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 17:13:57 +0000
Received: by mail-qg0-f47.google.com with SMTP id z60so7736985qgd.20
 for <ath10k@lists.infradead.org>; Mon, 01 Dec 2014 09:13:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAEFj986B15pFo2WY_2x0VwEXBEBy+j0-nff2-B=Ff=qP66iP_w@mail.gmail.com>
References: <547525D4.5080701@candelatech.com>
 <CAD1M061uAfCfCnnVY1bh6kCcXXZhwOOiyww5mkU8VkxGov9DwA@mail.gmail.com>
 <CAEFj986B15pFo2WY_2x0VwEXBEBy+j0-nff2-B=Ff=qP66iP_w@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Mon, 1 Dec 2014 09:13:03 -0800
Message-ID: <CAD1M061Ly=kCvPc5iuVvLR-gmEO-W2n8dZ=+D1sCshyiJqAxuw@mail.gmail.com>
Subject: Re: IBSS mode is now supported by CT firmware.
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Nov 26, 2014 at 5:04 PM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
> Are you joining the adhoc network in non-HT mode? Anyway, even if you
> use HT mode, the rate control is not working for 999.x firmware and
> always stuck at 6Mbps as far as I know.

Right, I should've been more clear. 6mbps rate when using any HT mdoe
(HT20/HT40+-), 54mbps rate in non-HT. Same behavior as the 999.x
firmware.

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
