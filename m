Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAizl-0007WF-KL
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 21:27:35 +0000
Received: by mail-wr0-x22c.google.com with SMTP id v60-v6so45072087wrc.7
 for <ath10k@lists.infradead.org>; Mon, 23 Apr 2018 14:27:23 -0700 (PDT)
Received: from debian64.daheim
 (p200300D5FBC125FC0000000000000830.dip0.t-ipconnect.de.
 [2003:d5:fbc1:25fc::830])
 by smtp.gmail.com with ESMTPSA id u37-v6sm14853680wrb.53.2018.04.23.14.27.20
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Apr 2018 14:27:20 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
 by debian64.daheim with esmtp (Exim 4.91)
 (envelope-from <chunkeey@gmail.com>) id 1fAizY-0004RM-1S
 for ath10k@lists.infradead.org; Mon, 23 Apr 2018 23:27:20 +0200
From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: failed to run otp: -22
Date: Mon, 23 Apr 2018 23:27:19 +0200
Message-ID: <2287275.ke1ujnQGTK@debian64>
In-Reply-To: <CACD9L=A9WZdeKpexptW1N1jLgfn0AmCLj0PQJQdFO1KyBnvZXw@mail.gmail.com>
References: <CACD9L=BXEQRQVWGP5iMvSNOP7nHz68W62+q6xEZkeb2vZ13DKQ@mail.gmail.com>
 <CAJ-Vmo=+2mVUHzQa7rrgfE9ARpedyBS17urUGjwLLoGgy2WSiw@mail.gmail.com>
 <CACD9L=A9WZdeKpexptW1N1jLgfn0AmCLj0PQJQdFO1KyBnvZXw@mail.gmail.com>
MIME-Version: 1.0
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
To: ath10k@lists.infradead.org

On Montag, 23. April 2018 22:31:22 CEST Arvid Picciani wrote:
> from where does ath10k know where to look for it? all i know about is
> ath79_register_wmac  in arch init. That points to a partition called
> "wifi" which makes ath9k work, but not ath10k.

It's this file:
<https://github.com/openwrt/openwrt/blob/master/target/linux/ar71xx/base-files/etc/hotplug.d/firmware/11-ath10k-caldata#L136>

Or

/etc/hotplug.d/firmware/11-ath10k-caldata
on your device. (Thing is, the partition should be called "art"?!
and there needs to be a handle for your archer-c7-v5.)




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
