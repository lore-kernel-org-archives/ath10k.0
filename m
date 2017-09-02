Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x22f.google.com ([2607:f8b0:4002:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1doBr4-00036B-SU
 for ath10k@lists.infradead.org; Sat, 02 Sep 2017 17:05:12 +0000
Received: by mail-yw0-x22f.google.com with SMTP id s187so11963021ywf.2
 for <ath10k@lists.infradead.org>; Sat, 02 Sep 2017 10:04:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-VmokZ6kzRwEmHOyYZL4m12jr4t_yMumXTf8MiJ7E6aGb7ZA@mail.gmail.com>
References: <20170902095224.xqrzlwajxwzs5bxz@eq.uc.pt>
 <CAJ-VmokZ6kzRwEmHOyYZL4m12jr4t_yMumXTf8MiJ7E6aGb7ZA@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Sat, 2 Sep 2017 10:04:49 -0700
Message-ID: <CAJ-Vmo=QU7BMOHxjea-qayP2no6z8t6wSiTUFffPu1YB2bqO1w@mail.gmail.com>
Subject: Re: Compex WLE600VX firmware crash
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
To: Nuno Oliveira <nuno@eq.uc.pt>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

So I asked around. I haven't gotten an official answer from QCA yet.

The peregrine caldata format uhm, "changed slightly" between versions
of 10.2, and they didn't make it backwards compatible. I need to ask
them about it again.

The later firmware works with the later caldata. The earlier firmware
works with the earlier caldata. I think it panics on any other
combination.

Thanks,



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
