Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDTgO-0004q1-Uz
 for ath10k@lists.infradead.org; Fri, 19 Oct 2018 12:15:13 +0000
From: Arthur Watt <arthur.watt@virtuosys.com>
Subject: FTM support on ath10k (QCA9984
Date: Fri, 19 Oct 2018 12:14:57 +0000
Message-ID: <DB7PR07MB46653AA5417BB7674EF7B3EDFFF90@DB7PR07MB4665.eurprd07.prod.outlook.com>
Content-Language: en-US
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

Good afternoon

I am trying to determine the amount of support for FTM (Fine Timing Measurement) in Linux wireless.
In particular the QCA9984 or QCA988X devices (on a 4.14 based kernel).

From what I have gathered so far:

User space  support
    hostapd/wpa_supplicant - controls beacon extended capabilities IE (but are not involved in FTM measurements)
    iw - none (although various unofficial patches are available to trigger FTM procedures)
Kernel space
    cfg80211, mac80211 - Virtually nothing
Device Drivers
    iwlwifi - Private load with a small community testing 
   ath10k - Virtually nothing - a few posts to patchwork with minor changes

Is my understanding of the state of FTM in Linux correct?

Has anyone else tried FTM on these devices?

Thank you

Arthur








_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
