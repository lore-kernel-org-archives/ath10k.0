Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-db5eur01on0083.outbound.protection.outlook.com
 ([104.47.2.83] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQddM-0003UZ-0k
 for ath10k@lists.infradead.org; Thu, 29 Jun 2017 17:53:42 +0000
Subject: Re: Is using 802.11s with DFS possible?
References: <CAOiRWuXVO5ACHCX6ZHy_rP1oA7+sgnnvtOTydHqUJWHjpBZTZw@mail.gmail.com>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <d4a7c59c-85f0-bbfb-84ce-ce0a6c7bf483@bowerswilkins.com>
Date: Thu, 29 Jun 2017 10:53:05 -0700
MIME-Version: 1.0
In-Reply-To: <CAOiRWuXVO5ACHCX6ZHy_rP1oA7+sgnnvtOTydHqUJWHjpBZTZw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Zach Sherin <zach@netblazr.com>, ath10k@lists.infradead.org



On 06/28/2017 06:54 PM, Zach Sherin wrote:
> Hi all,
>
> I've been running some experiments in LEDE thanks to your help many
> months ago, and I want to use DFS frequencies with my mesh network.
> Does ath10k currently support this or am I up a creek? My tests show
> that I can use DFS frequencies with AP mode but have always failed
> when I use them in a mesh, such that the interface won't even start.
>
> Any suggestions?
As far as I know, no DFS channels enabled in mesh mode at this moment.
To support DFS channels in mesh mode, wpa_supplicant and mac80211 
changes are required.
> Thanks for your time,
> Zach
>
> PS: I'm using an Archer C7 v2, latest stable LEDE build with the
> built-in ath10k firmware. Meshing on channel 36 is fine, but anything
> that requires DFS fails.
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
