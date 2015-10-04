Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zin5d-0006Sn-20
 for ath10k@lists.infradead.org; Sun, 04 Oct 2015 17:28:49 +0000
Received: by pacfv12 with SMTP id fv12so156016342pac.2
 for <ath10k@lists.infradead.org>; Sun, 04 Oct 2015 10:28:27 -0700 (PDT)
Message-ID: <1443979705.32531.71.camel@edumazet-glaptop2.roam.corp.google.com>
Subject: Re: Slow ramp-up for single-stream TCP throughput on 4.2 kernel.
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 04 Oct 2015 10:28:25 -0700
In-Reply-To: <56115C68.1080803@candelatech.com>
References: <560F1672.5000602@candelatech.com>
 <560F1F74.9010207@candelatech.com>
 <CADVnQym4U_dVVRdOVhORvVabwFjSHTQJ_LbbbYtzWVu0=mAp_A@mail.gmail.com>
 <56105AD2.7070906@candelatech.com>
 <CADVnQynKmhrpD63sF5aWPYo9f8L3wOMuEyACBnTdkzQQ=D1_uA@mail.gmail.com>
 <56115C68.1080803@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: netdev <netdev@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, ath10k <ath10k@lists.infradead.org>

On Sun, 2015-10-04 at 10:05 -0700, Ben Greear wrote:

> I guess I'll just stop using Cubic.  Any suggestions for another
> congestion algorithm to use?  I'd prefer something that worked well
> in pretty much any network condition, of course, and it has to work with
> ath10k.
> 
> We can also run some tests with 1G, 10G, ath10k, ath9k, and in conjunction
> with network emulators and various congestion control algorithms.

You could use cubic , but disable or tune HyStart, which is known to be
problematic anyway.

echo  0 >/sys/module/tcp_cubic/parameters/hystart_detect

Or try

echo 40 >/sys/module/tcp_cubic/parameters/hystart_low_window



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
