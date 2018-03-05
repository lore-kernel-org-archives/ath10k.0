Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esvpv-0007gq-ER
 for ath10k@lists.infradead.org; Mon, 05 Mar 2018 19:31:53 +0000
Subject: Re: [PATCH 1/2] ath10k: Add WMI FWTEST command support
References: <1520233148-26050-1-git-send-email-akolli@codeaurora.org>
 <1520233148-26050-2-git-send-email-akolli@codeaurora.org>
 <94f133b3-ee5d-6ed8-d7e8-20dff9aaede2@bowerswilkins.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <fd392368-5535-d10e-b1bb-934e45fd9c43@dd-wrt.com>
Date: Mon, 5 Mar 2018 20:31:33 +0100
MIME-Version: 1.0
In-Reply-To: <94f133b3-ee5d-6ed8-d7e8-20dff9aaede2@bowerswilkins.com>
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
To: Peter Oh <peter.oh@bowerswilkins.com>, Anilkumar Kolli <akolli@codeaurora.org>, ath10k@lists.infradead.org
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>, linux-wireless@vger.kernel.org

Am 05.03.2018 um 19:48 schrieb Peter Oh:
> From: Sathishkumar Muruganandam <murugana@codeaurora.org>
>> This patch adds support for WMI_FWTEST_CMD.
>> This command is used for setting the wifi parameters.
>
> It's too lack of information in commit message.
> You should add such what values are acceptable for which purpose by =

> each param_id and param_value to make this changes meaningful to =

> community.
i agree. i reviewed the firmware sourcecode to find out what its doing, =

but also within the firmware is almost undocumented. its a bunch of =

undocumented
numeric parameters with undocumented behaviour.
if qca is willig to document this feature it might be included.

Sebastian


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Stubenwaldallee 21a, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
