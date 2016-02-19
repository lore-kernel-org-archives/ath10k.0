Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWom2-0002Tl-TM
 for ath10k@lists.infradead.org; Fri, 19 Feb 2016 17:23:23 +0000
Received: by mail-wm0-x22f.google.com with SMTP id b205so77419825wmb.1
 for <ath10k@lists.infradead.org>; Fri, 19 Feb 2016 09:23:02 -0800 (PST)
Date: Fri, 19 Feb 2016 18:23:00 +0100
From: Tobias Predel <tobias.predel@gmail.com>
Subject: Re: ath10k and QCA3977 - random transfer rate losses
Message-ID: <20160219172300.GA9252@localhost.fritz.box>
References: <20160212203036.GA22070@localhost> <56BF1C48.9000206@gmail.com>
 <20160214154651.GA16161@localhost.fritz.box>
 <56C0C12F.5010900@gmail.com>
 <20160214214016.GA27902@localhost.fritz.box>
 <22d26207d398427b9ea847881e6a3a1f@NALASEXR01G.na.qualcomm.com>
 <20160219091602.GA7702@localhost.fritz.box>
 <CAJ-VmomFHCiiK+OQfafcSJFda7c=WU+bbgK7fpm7GT37LS1YKw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ-VmomFHCiiK+OQfafcSJFda7c=WU+bbgK7fpm7GT37LS1YKw@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: vagner_ <vagnerrener@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Hsu,
 Ryan" <ryanhsu@qca.qualcomm.com>

On Fri, Feb 19, 2016 at 08:07:49AM -0800, Adrian Chadd wrote:
> Ok, so it's a board file problem? this can be solved by telling kvalo@
> about it, right?
> 
> 
> -a

Yes, they differ and the board-2.bin file isn't included neither in linux-firmware nor in kvalo's repository. 

MD5 checksums:
73cca12b9398f0cecaa3cfa35c8961b7  board-2.bin
44349f6ae93cf9ceffb164f58d4fb124  board.bin

I'll try to contact him and send the board file. 

Tobias

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
