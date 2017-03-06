Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckxd4-0007ZQ-9M
 for ath10k@lists.infradead.org; Mon, 06 Mar 2017 18:45:08 +0000
From: "Hsu, Ryan" <ryanhsu@qca.qualcomm.com>
Subject: Re: 4.9 Kernel panic on ACS and intermittent ability to host AP
Date: Mon, 6 Mar 2017 18:44:43 +0000
Message-ID: <9d5f2f03-b0fa-986f-ef54-36590200052f@qca.qualcomm.com>
References: <CALJ2kaG9Q-_XVi=GrXRZZwRa4Ptd1yMj4tpShEqxB2k2MKXjdQ@mail.gmail.com>
In-Reply-To: <CALJ2kaG9Q-_XVi=GrXRZZwRa4Ptd1yMj4tpShEqxB2k2MKXjdQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <6D4AD56338757347A695B7ACEA0036FA@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/06/2017 06:37 AM, Chris Price wrote:

> This has been working for me so far (patch + new firmware).

Glad to hear that!!
Seems to be like the old firmware has some issue to support ACS, and no one really tested that before as well... :(

> The only unusual behaviour I've seen is that the 5 GHz AP seems to fail to
> start on the first try after boot, 

Could you share the logs with both driver and hostapd (-vvv), please?


Ryan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
