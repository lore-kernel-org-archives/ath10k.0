Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzcVP-0005nh-54
 for ath10k@lists.infradead.org; Sun, 26 Jul 2020 08:59:41 +0000
Subject: Re: [RFC 0/7] Add support to process rx packets in thread
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch> <20200725081633.7432-1-hdanton@sina.com>
 <20200726012244.15264-1-hdanton@sina.com>
 <20200726083239.5060-1-hdanton@sina.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <805e66e3-3090-61d2-1fda-50421eb99e3d@nbd.name>
Date: Sun, 26 Jul 2020 10:59:27 +0200
MIME-Version: 1.0
In-Reply-To: <20200726083239.5060-1-hdanton@sina.com>
Content-Language: en-US
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
To: Hillf Danton <hdanton@sina.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Ding Zhao Nan <oshack@hotmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "dianders@chromium.org" <dianders@chromium.org>, David Laight <David.Laight@ACULAB.COM>, Rakesh Pillai <pillair@codeaurora.org>, "evgreen@chromium.org" <evgreen@chromium.org>, "kuba@kernel.org" <kuba@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "davem@davemloft.net" <davem@davemloft.net>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>

On 2020-07-26 10:32, Hillf Danton wrote:
> 
> On Sun, 26 Jul 2020 10:10:15 +0200 Felix Fietkau wrote:
>> On 2020-07-26 03:22, Hillf Danton wrote:
>> > 
>> > Feel free to do that. Is it likely for me to select a Cc?
>> > 
>> Shall I use Signed-off-by: Hillf Danton <hdanton@sina.com>?
> 
> s/Signed-off-by/Cc/
> 
>> What Cc do you want me to add?
> 
> I prefer Cc over other tags.
Ah, okay. I was planning on adding you as the author of the patch, since
you did most of the work on it. If you want to be attributed as author
(or in Co-developed-by), I'd need your Signed-off-by.

If you don't want that, I can submit it under my name and leave you in
as Cc only.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
