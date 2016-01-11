Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x235.google.com ([2607:f8b0:4001:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIfEO-0003yV-8B
 for ath10k@lists.infradead.org; Mon, 11 Jan 2016 16:22:09 +0000
Received: by mail-io0-x235.google.com with SMTP id q21so353546347iod.0
 for <ath10k@lists.infradead.org>; Mon, 11 Jan 2016 08:21:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkdD9+pcTOzZJAOR4-G2vZ8AeYBvhutwa=5XHy9xOUPuQ@mail.gmail.com>
References: <45672dcebea40166c2e5edc31c818b96@openmailbox.org>
 <CA+BoTQkmR95XqsKsjeDOR1b_+0srg8ydFgutfUG+M6C27XwrMw@mail.gmail.com>
 <1b49b497f4f2551430f7594521c9d9b0@openmailbox.org>
 <CA+BoTQkdD9+pcTOzZJAOR4-G2vZ8AeYBvhutwa=5XHy9xOUPuQ@mail.gmail.com>
Date: Mon, 11 Jan 2016 08:21:45 -0800
Message-ID: <CAJ-VmomFLU6NXmxaBrpeL1c1wMvzFBsorbL4YP3s1vmsPfVT_Q@mail.gmail.com>
Subject: Re: QCA6174 seemingly randomly fails to wake
From: Adrian Chadd <adrian@freebsd.org>
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
Cc: theros@openmailbox.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

Hm. I recall there are bugs handling PCI-PS state stuff in hardware.
We should check with QCA. It .. keeps changing.

(Who has access to the current windows reference driver? They may know.)

-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
