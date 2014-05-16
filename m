Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlDBE-0001Dw-1D
 for ath10k@lists.infradead.org; Fri, 16 May 2014 08:07:50 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Fri, 16 May 2014 10:03:57 +0200
Subject: RE : RE : RE : RE : RE : ath10k: set channel by command "iw" not
 from hostapd and DFS support of firmware-2.bin_10.1.467.2-1
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F109978D4@srvexch01.SODIELEC.local>
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <5373382C.1030709@elisanet.fi>
 <EE97821C81277E459BEA5C6384C6F241012F109978C9@srvexch01.SODIELEC.local>
 <DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>
 <EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>
 <CALhHN=pGozL43B+qiJ20it3QCkvKkOL_RynfvUod_Ert8v1+3Q@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978CF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978D1@srvexch01.SODIELEC.local>
 <CALhHN=q_kuaszuBdsWHLZJYEA1PW63AqDFiF89DC3c4pOJseOg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D3@srvexch01.SODIELEC.local>
 <CALhHN=pYKwhCRy8RZWFm=5mssrL=oqTsazWfkVaN2L8O6YNO3w@mail.gmail.com>,
 <CACKGw+ECRrMxk4Q4Rk_PMm0WDqnyK5x9YdKSPYus_zMHxvi17Q@mail.gmail.com>
In-Reply-To: <CACKGw+ECRrMxk4Q4Rk_PMm0WDqnyK5x9YdKSPYus_zMHxvi17Q@mail.gmail.com>
Content-Language: fr-FR
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>, Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

>> Seems CONFIG_ATH10K_DFS_CERTIFIED is not set.
>> You can simply check this during compilation adding eg. to mac.c
>> #ifndef CONFIG_ATH10K_DFS_CERTIFIED
>> #error DFS_NOT_SET
>> #endif

I'm quite sure that CONFIG_ATH10K_DFS_CERTIFIED is enabled because the 3 debug file dfs_block_radar_events, dfs_simulate_radar, dfs_stats is
only created if CONFIG_ATH10K_DFS_CERTIFIED=y ? And I had these 3 files in my folder debug fs but "dfs_stats" show "DFS not enabled"

>> I am not sure but could be if you kernel is old and didn't have this
>> option (which is available in backports) then will  be not set.
>> @Bartosz didn't we have same problem, do you remember how this was solved?

>I assume you are using backports, right? I think I hit something
>similar when I was compiling my own backports package (under openwrt).
>The backports were generated from ath.git. I think the root cause for
>me those days was outdated .local-symbols file from the backports and
>lack of 'ATH10K_DFS_CERTIFIED=' there (I 'mixed' the original
>comapt-wireless from openwrt and my own backports). But I have no idea
>if you are facing something similar, since I do not know your build setup..

Yes I'm using backport v3.15 (latest) to build ath10k for my kernel 3.2.36 (provided by Marvell for my Marvell Armada 370 chipset).
I also download the folder ath from ath10k master branch (I got problem with seeing information of fw_stats from the version ath10k in backport).
Any suggestion? Please feel free to ask me more information if you need :D


NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
