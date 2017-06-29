Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQOfF-0005AX-Fy
 for ath10k@lists.infradead.org; Thu, 29 Jun 2017 01:54:39 +0000
Received: by mail-vk0-x22f.google.com with SMTP id r126so42753473vkg.0
 for <ath10k@lists.infradead.org>; Wed, 28 Jun 2017 18:54:16 -0700 (PDT)
MIME-Version: 1.0
From: Zach Sherin <zach@netblazr.com>
Date: Wed, 28 Jun 2017 21:54:14 -0400
Message-ID: <CAOiRWuXVO5ACHCX6ZHy_rP1oA7+sgnnvtOTydHqUJWHjpBZTZw@mail.gmail.com>
Subject: Is using 802.11s with DFS possible?
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

Hi all,

I've been running some experiments in LEDE thanks to your help many
months ago, and I want to use DFS frequencies with my mesh network.
Does ath10k currently support this or am I up a creek? My tests show
that I can use DFS frequencies with AP mode but have always failed
when I use them in a mesh, such that the interface won't even start.

Any suggestions?

Thanks for your time,
Zach

PS: I'm using an Archer C7 v2, latest stable LEDE build with the
built-in ath10k firmware. Meshing on channel 36 is fine, but anything
that requires DFS fails.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
