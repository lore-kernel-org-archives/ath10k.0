Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqKrP-0007hX-LD
 for ath10k@lists.infradead.org; Mon, 17 Nov 2014 11:52:48 +0000
From: Sujith Manoharan <sujith@msujith.org>
Message-ID: <21609.57811.107846.718878@gargle.gargle.HOWL>
Date: Mon, 17 Nov 2014 17:23:55 +0530
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Block radar events when requested
In-Reply-To: <CA+BoTQkpqVKVHFoXuTJtkTmFZA0XfU56nLRaVegWUr29z83_tQ@mail.gmail.com>
References: <1416209393-24736-1-git-send-email-sujith@msujith.org>
 <CA+BoTQkpqVKVHFoXuTJtkTmFZA0XfU56nLRaVegWUr29z83_tQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior wrote:
> The simulate_radar knob is meant to be used with
> dfs_block_radar_events being true in the first place so you can easily
> block real DFS events and inject fake ones for testing of DFS upper
> layers with ath10k.
> 
> Your patch breaks this. Why would you want to do that?

Apparently, this knob is also being used to make sure that
radar detection doesn't happen when NOL is disabled.

I'll check if this test case is needed at all before
adding another knob to the existing pile...

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
