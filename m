Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdF3k-0005mM-E2
 for ath10k@lists.infradead.org; Fri, 26 Aug 2016 11:12:29 +0000
Message-ID: <1472209920.390.34.camel@sipsolutions.net>
Subject: Re: [PATCH v3] ath10k: implement NAPI support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 26 Aug 2016 13:12:00 +0200
In-Reply-To: <CAA93jw7vHWROH9Ymq1UoOKA5kw+fDbCM=vJehs8J=QP2PVs_RA@mail.gmail.com>
 (sfid-20160826_124913_305753_49D4FF3C)
References: <20160826102250.24174-1-rmanohar@qti.qualcomm.com>
 <CAA93jw7vHWROH9Ymq1UoOKA5kw+fDbCM=vJehs8J=QP2PVs_RA@mail.gmail.com>
 (sfid-20160826_124913_305753_49D4FF3C)
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
To: Dave Taht <dave.taht@gmail.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>, ath10k <ath10k@lists.infradead.org>

On Fri, 2016-08-26 at 03:48 -0700, Dave Taht wrote:
> I'm always rather big on people testing latency under load, and napi
> tends to add some.

That's a completely useless comment.

Obviously, everybody uses NAPI; it's necessary for system load and thus
performance, and lets drivers take advantage of TCP merging to reduce
ACKs, which is tremendously helpful (over wifi in particular.)

Please stop making such drive-by comments that focus only on the single
thing you find important above all; not all people can care only about
that single thing, and unconstructively reiterating it over and over
doesn't help.

Thanks,
johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
