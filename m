Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wj0-x241.google.com ([2a00:1450:400c:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYEwd-00027O-2O
 for ath10k@lists.infradead.org; Mon, 30 Jan 2017 16:36:45 +0000
Received: by mail-wj0-x241.google.com with SMTP id ip10so8504384wjb.1
 for <ath10k@lists.infradead.org>; Mon, 30 Jan 2017 08:36:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1591748.RGYhBEn8I1@bentobox>
References: <1591748.RGYhBEn8I1@bentobox>
From: Adrian Chadd <adrian@freebsd.org>
Date: Mon, 30 Jan 2017 08:36:19 -0800
Message-ID: <CAJ-Vmom3g+cbNG7hXjUB=Rnh9S_rHmr7hS2Z6H+m=LQCfezBAg@mail.gmail.com>
Subject: Re: QCA4019: calibration files and board files
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
To: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

[snip]

hi!

ok, so here's what's going on behind the scenes.

* I can't talk about what Christian did, where he got the board data
from, etc, etc. You mentioned a DK style board, but didn't say which.
* For example, the ath10k in the "official" QSDK software reference
platform doesn't work out of the box on DK07, because the BMI IDs
aren't in the default IPQ4017 config (eg DK07 can be 2G/5G/pcie or
5G/5G/pcie, depending!)
* .. and the cascade/besra NICs that ship in the DK07 reference boards
also don't exist in the ath10k board-2.bin file because again they're
boards whose BMI IDs aren't shipped;
* .. so, after chatting with QCA as a customer, I discovered which
board.bin template files I needed from their firmware release to match
the boards that we have, and I built custom board-2.bin files with the
relevant stuff, and it works.

Each board data is custom for the board layout / part selection - it's
a template that is used during calibration. The data in OTP is just a
diff against the board template  (board.bin / board-2.bin.) The data
in /flash/ on ath9k is the whole calibration block; but in OTP for
ath9k is just the diff against a template. I don't recall what
happened for ath10k and it's too early for me (read: not enough
coffee) to read the source to see if the ath10k board data is the
same.

If people aren't using unique BMI IDs (which is another question we
have for QCA) then it's possible you don't have enough information to
"know" which board data to use, so it has to be overridden by a custom
package. We do this at work for our own boards as well - they're
sufficiently different to a reference board that indeed we need to
"know".

Now, the reason for pre-loading the calibration data is because it's
needed early in the boot process so the firmware/driver has some idea
of what the hardware is.

So, the driver steps should be:

* If you have a pre-calibration file, you load that in before you kick
the firmware too hard;
* then you read the calibration data /back/ - then the normal firmware
process will fetch the board ID;
* then it loads the board-2.bin matching the board/BMI ID, then
* starts things normally.

Now, I forget if the pre-cal data (and say, data in flash versus data
in OTP) is the whole thing or a diff against the board data. I'd have
to triple-check. The OTP data is certainly just a diff against the
board data.

It's possible they could shave off some of these steps if you have
pre-cal data, but I bet it's done like this to minimise the amount of
special casing going on. Each step may have a special case, but once
you get to the "fetch board ID" step it should continue along
correctly.

HTH,



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
