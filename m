Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22c.google.com ([2607:f8b0:400c:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjhKG-0008Kd-6d
 for ath10k@lists.infradead.org; Mon, 12 May 2014 03:54:52 +0000
Received: by mail-ve0-f172.google.com with SMTP id oz11so8106078veb.31
 for <ath10k@lists.infradead.org>; Sun, 11 May 2014 20:54:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53703B61.3050305@candelatech.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Sun, 11 May 2014 23:54:08 -0400
Message-ID: <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
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

On Sun, May 11, 2014 at 11:09 PM, Ben Greear <greearb@candelatech.com> wrote:
> Can you reproduce with any other type of station
> device?

I'll try.  It's a little tricky since it seems to involve running
Chrome, etc, rather than my usual command-line tests for which I have
a wider variety of clients.

> Also, have you tried sniffing with a third device to see if
> the AP actually puts the ICMP responses on the air?

I did try that.  As far as I can tell, the ICMP responses are simply
not being sent at all.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
