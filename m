Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0yjn-0002Z6-KB
 for ath10k@lists.infradead.org; Fri, 05 Jun 2015 21:01:12 +0000
Received: by oiww2 with SMTP id w2so61873789oiw.0
 for <ath10k@lists.infradead.org>; Fri, 05 Jun 2015 14:00:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55720425.2050604@candelatech.com>
References: <1430829048-22549-1-git-send-email-vthiagar@qti.qualcomm.com>
 <5571D903.7060203@candelatech.com>
 <CAFuUQkjP18E6fjvgZMayJYiEQtpjVUAKb+_zDmS3yBfi-QF8Cg@mail.gmail.com>
 <5571F70D.4020101@candelatech.com>
 <55720425.2050604@candelatech.com>
Date: Fri, 5 Jun 2015 14:00:49 -0700
Message-ID: <CAFuUQkgeCY2wS1NJoA1qS4NTJuvwZuiMAp=dZx=kErc6N-Da_Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Fix survey information reporting
From: YanBo <dreamfly281@gmail.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Fri, Jun 5, 2015 at 1:18 PM, Ben Greear <greearb@candelatech.com> wrote:
> I think the wrapping might be even more weird that previously suspected.  Here is output from my
> system.
>
> It looks to me that when cycle count overflows, it right-shifts all of these
> counters one bit.  Clever, I guess, but surely a pain in the ass to deal with!
>
>
> while true; do cat /debug/ieee80211/wiphy0/ath10k/fw_stats|head -10|tail -4; date; echo;sleep 1; done
> ....
>                 TX frame count  131810463
>                 RX frame count 2326362883
>                 RX clear count 2542947851
>                    Cycle count 4180338939
> Fri Jun  5 13:13:48 PDT 2015
>
>                 TX frame count  134407497
>                 RX frame count 2374518035
>                 RX clear count 2595337341
>                    Cycle count 4269010333
> Fri Jun  5 13:13:49 PDT 2015
>
>                 TX frame count   69523007
>                 RX frame count 1229973316
>                 RX clear count 1344131636
>                    Cycle count 2210412416
> Fri Jun  5 13:13:50 PDT 2015
>
>                 TX frame count   72305753
>                 RX frame count 1280184579
>                 RX clear count 1398937635
>                    Cycle count 2299234941
> Fri Jun  5 13:13:51 PDT 2015
>
>                 TX frame count   75050021
>                 RX frame count 1330205664
>                 RX clear count 1453548082
>                    Cycle count 2387901854
> Fri Jun  5 13:13:52 PDT 2015
>
>
The scan count is 32 bits hence, it will wrap rapidly with 24 seconds
cycle, the new WMI interface will
supply these count in 64 bits to avoid such issue.

BR /Yanbo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
