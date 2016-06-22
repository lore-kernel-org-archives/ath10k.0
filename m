Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFiq6-0005lv-1b
 for ath10k@lists.infradead.org; Wed, 22 Jun 2016 14:09:11 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: Cannot initialize Compex WLE600VX for 802.11ac?
Date: Wed, 22 Jun 2016 14:08:40 +0000
Message-ID: <87r3bpfh94.fsf@kamboji.qca.qualcomm.com>
References: <57dtwgmmwmr.fsf@cerise.info9.net>
 <87y45xiuts.fsf@kamboji.qca.qualcomm.com>	<57dd1n9mks5.fsf@cerise.info9.net>
In-Reply-To: <57dd1n9mks5.fsf@cerise.info9.net> (Tom Marble's message of "Wed, 
 22 Jun 2016 08:10:34 -0500")
Content-Language: en-US
Content-ID: <EB5426184BC1774EA7AD844A474C0010@qualcomm.com>
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
To: Tom Marble <tmarble@info9.net>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Tom Marble <tmarble@info9.net> writes:

> "Valo, Kalle" <kvalo@qca.qualcomm.com> writes:
>> Do you have CONFIG_ATH10K_DFS_CERTIFIED enabled?
>
> No.. the option isn't even commented out in my .config??

It depends on CFG80211_CERTIFICATION_ONUS so you need to enable that
first.

> Is there are tree other than...
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git

That tree contains the latest ath10k code, so that's ok.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
