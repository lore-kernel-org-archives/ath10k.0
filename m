Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjgC0-0003tj-Ao
 for ath10k@lists.infradead.org; Fri, 22 Nov 2013 02:10:00 +0000
Received: by mail-wi0-f182.google.com with SMTP id en1so1966857wid.3
 for <ath10k@lists.infradead.org>; Thu, 21 Nov 2013 18:09:36 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 21 Nov 2013 18:09:36 -0800
Message-ID: <CAPqRyK8aiF4cnz+V9bDyPKPakjZ5ee3e+OFxmsnTaTMhh8An5g@mail.gmail.com>
Subject: active/idle time from ath10k
From: Phil Moora <phil.moora@gmail.com>
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
To: ath10k <ath10k@lists.infradead.org>

Hi all,

Is there a way to get radio active time or idle time from ath10k? By
active time, I mean that the radio was transmitting or receiving
something.

I looked at ath10k_get_survey function but
(1) I don't want/need to hop across channels, just need the statistics
for my radio's current channel,
(2) I want the statistics periodically, as opposed to survey dump
which is only available at request.

Any pointers?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
