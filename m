Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip8qX-0003wn-JX
 for ath10k@lists.infradead.org; Wed, 08 Jan 2020 10:45:54 +0000
Received: by mail-oi1-x242.google.com with SMTP id c77so2212980oib.7
 for <ath10k@lists.infradead.org>; Wed, 08 Jan 2020 02:45:52 -0800 (PST)
MIME-Version: 1.0
References: <1576221593-1086-1-git-send-email-yiboz@codeaurora.org>
 <1576221593-1086-4-git-send-email-yiboz@codeaurora.org>
In-Reply-To: <1576221593-1086-4-git-send-email-yiboz@codeaurora.org>
From: Justin Capella <justincapella@gmail.com>
Date: Wed, 8 Jan 2020 02:46:31 -0800
Message-ID: <CAMrEMU8qoD=-45sePbp+W+F+5mQmviMQaZjzXe_Ph2cNjan+OA@mail.gmail.com>
Subject: Re: [PATCH 3/4] mac80211: fix low throughput in multi-clients
 situation
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
To: Yibo Zhao <yiboz@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

Is there a risk of division by zero?

I'm curious about IEEE80211_AIRTIME_QUANTUM in this multiple sta
scenario, should weight maybe be the depth of the queue or something
like that? Using real time delta I assume is not performant?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
