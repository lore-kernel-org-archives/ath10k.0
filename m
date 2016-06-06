Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9y5N-0001pN-Ua
 for ath10k@lists.infradead.org; Mon, 06 Jun 2016 17:13:30 +0000
Received: by mail-vk0-x22b.google.com with SMTP id d127so208391079vkh.2
 for <ath10k@lists.infradead.org>; Mon, 06 Jun 2016 10:12:48 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 6 Jun 2016 13:12:46 -0400
Message-ID: <CAOiRWuVxbGDoVtxahwRxyH9NaBB9LmaEBZ5bzgSPEf=Eu1g=ug@mail.gmail.com>
Subject: Any tips on where per-packet antenna selection could be pushed?
From: Zach Sherin <zach@netblazr.com>
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

I'm working on a device with antenna selection, similar to the ideas
behind Ruckus or Google's Onhub router. I've been looking into a
solution for per-packet antenna selection (based on destination/next
hop). I was hoping this list might be able to suggest where I should
investigate adding that switching code. My switches are currently USB
RF switches, but I'm going to be using some serial protocol for the
final version (we don't have much to switch, and it should be a single
byte per packet).

The last suggestion I received was to emulate Netsed [1] by routing
all packets through a specific socket, running antenna selection, and
then pushing them to their final destinations.

I assumed that the best place to do antenna selection would be within
ath10k itself (my devices all run on ath10k) so that I could introduce
the minimum possible latency with antenna selection. Should I be
looking at a different part of the networking stack?

Does anyone have any suggestions, or perhaps an open-source project
out there already trying to do antenna selection?

Thanks,
Zach


[1] http://silicone.homelinux.org/projects/netsed/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
