Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22e.google.com ([2607:f8b0:400c:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjiel-00027T-IB
 for ath10k@lists.infradead.org; Mon, 12 May 2014 05:20:09 +0000
Received: by mail-ve0-f174.google.com with SMTP id jw12so8068833veb.19
 for <ath10k@lists.infradead.org>; Sun, 11 May 2014 22:19:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <537056B1.6060902@candelatech.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Mon, 12 May 2014 01:19:24 -0400
Message-ID: <CAHqTa-0VEyuWY6b6DFn-YUKjUEWT1+Ph+O_WNU4u1t1Eqv4ASQ@mail.gmail.com>
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
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
Cc: ath10k <ath10k@lists.infradead.org>

On Mon, May 12, 2014 at 1:05 AM, Ben Greear <greearb@candelatech.com> wrote:
> If it's getting on the air, then I think the only way to figure out
> what is wrong is to decode the packets and see if they are encrypted
> properly or not.  I think there is a way to get wireshark to decode
> pkts by feeding it the proper keys, but I have not ever actually tried
> doing that.
>
> If pkts do not get on the air, then possibly the tx status and/or tx
> error counters could tell you why, but it seems that is not relevant
> in this case.

Okay, in fact I just learned how to use that wireshark feature last
week, so I tried it just now and it worked.  It clearly shows the
downstream packets from the AP *are* decryptable from wireshark, but
they get no replies from the macbook (and the macbook doesn't show
them at its IP layer).

Any guesses?  Does that mean somehow the macbook got the wrong
*decryption* keys or something?

I'm currently trying to wade through the giant wireshark capture
trying to find the actual point where the dropout occurred, but it
seems to slow down a bit with 1.5 million frames captured :)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
