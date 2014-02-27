Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22a.google.com ([2607:f8b0:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ1Em-00061g-3O
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 13:42:56 +0000
Received: by mail-vc0-f170.google.com with SMTP id hu8so2488742vcb.15
 for <ath10k@lists.infradead.org>; Thu, 27 Feb 2014 05:42:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <530E6DBF.4060407@candelatech.com>
References: <530D128B.3030509@candelatech.com>
 <87sir5kc5t.fsf@kamboji.qca.qualcomm.com>
 <530E2873.8000506@candelatech.com>
 <530E6DBF.4060407@candelatech.com>
Date: Thu, 27 Feb 2014 21:42:32 +0800
Message-ID: <CAEFj985joW0f6EnOriFoY6cLSQVSBEj7jc5JQMjG0wXPt54NKg@mail.gmail.com>
Subject: Re: Anyone have a working hostapd conf file for AC?
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

> With this I can get around 380Mbps TCP throughput downloading,
> over the air, using the .467 firmware.  I have not yet tried to
> do any significant tuning to improve this throughput.

Quite impressive. Is this tested using iperf? I saw that even though
the rx rate is MCS9 NSS 3 SGI 80MHz. I only get about 98Mbps TCP
throughput using IPerf.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
