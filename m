Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e36zW-0000OO-1K
 for ath10k@lists.infradead.org; Fri, 13 Oct 2017 20:55:35 +0000
Received: by mail-wr0-x235.google.com with SMTP id q42so1853672wrb.7
 for <ath10k@lists.infradead.org>; Fri, 13 Oct 2017 13:55:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <59E124EB.6090602@candelatech.com>
References: <1507068826-14677-1-git-send-email-greearb@candelatech.com>
 <87a80vnrsb.fsf@kamboji.qca.qualcomm.com>
 <CAJ-Vmon0SszxH22Zb+O5RVQSommFFuc5XmG+at9=xbGagOb7PQ@mail.gmail.com>
 <59E124EB.6090602@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 13 Oct 2017 13:55:11 -0700
Message-ID: <CAJ-Vmo=dK0BSwE99Bx+qE2b1qokg_MyXTvhZTFLPcSbRwFGOfA@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: Retry pci probe on failure.
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
To: Ben Greear <greearb@candelatech.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

[snip]

* WMI setup stuff fails locally because of memory fragmentation when
you reload the driver. Heh. Sigh.
* I also see the PCI wakeup failures, so I'm going to go poke that
soon and see what I find.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
