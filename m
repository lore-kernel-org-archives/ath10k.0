Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkMu5-00048k-SN
 for ath10k@lists.infradead.org; Wed, 14 May 2014 00:18:38 +0000
Received: by mail-vc0-f175.google.com with SMTP id hu19so1477247vcb.6
 for <ath10k@lists.infradead.org>; Tue, 13 May 2014 17:18:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5372A1A7.2080602@candelatech.com>
References: <53729DED.6000104@candelatech.com>
 <CAHqTa-2OCz30cetjY3pALup-e0WL=YRLOkrB3Q6QmSyQBxdvhQ@mail.gmail.com>
 <5372A1A7.2080602@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 13 May 2014 20:17:55 -0400
Message-ID: <CAHqTa-3xqtoU+hTazpRJZCMQX27Uyyi0HFjkJ9LvrGCd2Mv4vg@mail.gmail.com>
Subject: Re: FYI: msdu-desc must be multiple of 8.
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

On Tue, May 13, 2014 at 6:50 PM, Ben Greear <greearb@candelatech.com> wrote:
> As an aside, if you do manage to crash firmware in this manner, it also
> takes down the host when it tries to clean up the stale tx buffers.  Possibly
> that bug is just due to some of my own patches, but might be worth investigating
> some day when I have more time and a cleaner tree...

At least on my boxes, firmware crashes lead to kernel panics pretty
often, say 1/3 of the time.  There appear to be lots of ways the
cleanups are still not happening properly on a firmware crash.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
