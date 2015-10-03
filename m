Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiPh9-0005It-2u
 for ath10k@lists.infradead.org; Sat, 03 Oct 2015 16:29:59 +0000
Received: by obbbh8 with SMTP id bh8so102324629obb.0
 for <ath10k@lists.infradead.org>; Sat, 03 Oct 2015 09:29:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <560F1F74.9010207@candelatech.com>
References: <560F1672.5000602@candelatech.com>
 <560F1F74.9010207@candelatech.com>
Date: Sat, 3 Oct 2015 12:29:36 -0400
Message-ID: <CADVnQym4U_dVVRdOVhORvVabwFjSHTQJ_LbbbYtzWVu0=mAp_A@mail.gmail.com>
Subject: Re: Slow ramp-up for single-stream TCP throughput on 4.2 kernel.
From: Neal Cardwell <ncardwell@google.com>
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
Cc: netdev <netdev@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Fri, Oct 2, 2015 at 8:21 PM, Ben Greear <greearb@candelatech.com> wrote:
> Gah, seems 'cubic' related.  That is the default tcp cong ctrl
> I was using (same in 3.17, for that matter).

There have been recent changes to CUBIC that may account for this. If
you could repeat your test with more instrumentation, eg "nstat", that
would be very helpful.

nstat > /dev/null
# run one test
nstat

Also, if you could take a sender-side tcpdump trace of the test, that
would be very useful (default capture length, grabbing just headers,
is fine).

Thanks!

neal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
