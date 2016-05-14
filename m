Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1RLA-0002nL-4j
 for ath10k@lists.infradead.org; Sat, 14 May 2016 04:38:13 +0000
References: <1462204347-31012-1-git-send-email-mohammed@qca.qualcomm.com>
 <87ziru9ejj.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <d97cb18f-7c21-fa39-d6e7-5edff0d0e7b4@dd-wrt.com>
Date: Sat, 14 May 2016 06:37:50 +0200
MIME-Version: 1.0
In-Reply-To: <87ziru9ejj.fsf@kamboji.qca.qualcomm.com>
Subject: 802.11ac lower extension channel
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello

a long time ago i discovered that ath10k doesnt seem to support lower =

extension channel configuration which raises also a bug report for =

DD-WRT in my case.
when will this issue be fixed?
if i set channel 100 and extension channel to 106 (and ht40+) in =

hostapd, all is working
but channel 108 and extension channel 102 (-6) and ht40- it will be refused

does somebody or you know how to configure it properly or is it really =

not possible at the time. and if not possible, will it be fixed in future?

-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email:s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
