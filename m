Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from champagne.comp.nus.edu.sg ([137.132.80.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZfHv-00041J-Kk
 for ath10k@lists.infradead.org; Tue, 16 Aug 2016 14:24:20 +0000
Received: from mail-it0-f69.google.com ([209.85.214.69])
 by champagne.comp.nus.edu.sg (Exim) with esmtps (TLSv1:DES-CBC3-SHA:168)
 id 1bZfHY-0006cZ-Mr
 for ath10k@lists.infradead.org; Tue, 16 Aug 2016 22:23:57 +0800
Received: by mail-it0-f69.google.com with SMTP id d65so252333625ith.0
 for <ath10k@lists.infradead.org>; Tue, 16 Aug 2016 07:23:56 -0700 (PDT)
MIME-Version: 1.0
From: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Date: Tue, 16 Aug 2016 22:23:14 +0800
Message-ID: <CA+uUJGs7HGamb3duZ_9PYfx++43F3UWE2nO4C3AN9Saen=iMrA@mail.gmail.com>
Subject: DFS radar pattern detection in different regions
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
To: ath10k <ath10k@lists.infradead.org>, wireless-regdb@lists.infradead.org

Hi,

I am aware that DFS scan and pattern detection is possible in ath10k
or to be precise it is implemented in the ath kernel module. From the
source code (dfs_pattern_detector.c), I can see that there are
patterns specific to ETSI, FCC and JP regulatory regions.

I got some conceptual questions regarding the pattern detection and regulations:

Q.1 For a given country, the wireless-regdb [1] specifies one of these
3 regions for DFS. For example, "country AE: DFS-FCC" or "country AF:
DFS-ETSI". What does this mean? Does it mean that country AE follows
DFS rules of FCC and that country AF follows those of ETSI?

Q.2 If the above is the case, then can I run ath10k "correctly" as
well as "legally" in country AE, given that pattern detection is
implemented for FCC? When I say "correctly", I mean that pattern
detection will not have any false negatives. And when I say "legally",
I mean that my ath10k device would comply with the local regulations
of country AE, given that my device is FCC DFS compliant.

It is little hard to believe that all the world's radar patterns could
be covered by 3 regulatory standards (FCC, ETSI and JP). Also if that
was the case, then ath10k already does a very good job with DFS
channels and the new swanky 802.11ac devices such as [2] are simply
not worth their price!

I would appreciate if someone can provide a clarification around this.

Thanks,
Raj

[1] http://git.kernel.org/cgit/linux/kernel/git/sforshee/wireless-regdb.git/tree/db.txt
[2] https://www.kickstarter.com/projects/portalwifi/portal-turbocharged-wifi/description

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
