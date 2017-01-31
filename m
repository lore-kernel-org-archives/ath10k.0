Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYVQh-0008J9-5B
 for ath10k@lists.infradead.org; Tue, 31 Jan 2017 10:12:53 +0000
Received: by mail-wm0-x22b.google.com with SMTP id c85so253657177wmi.1
 for <ath10k@lists.infradead.org>; Tue, 31 Jan 2017 02:12:25 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Subject: Re: QCA4019: calibration files and board files
Date: Tue, 31 Jan 2017 11:12:19 +0100
Message-ID: <3540233.YkkzMqOKRI@bentobox>
In-Reply-To: <CAJ-Vmom3g+cbNG7hXjUB=Rnh9S_rHmr7hS2Z6H+m=LQCfezBAg@mail.gmail.com>
References: <1591748.RGYhBEn8I1@bentobox>
 <CAJ-Vmom3g+cbNG7hXjUB=Rnh9S_rHmr7hS2Z6H+m=LQCfezBAg@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8306767690436136120=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>
Cc: Christian Lamparter <chunkeey@googlemail.com>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Raja Mani <rmani@qti.qualcomm.com>

--===============8306767690436136120==
Content-Type: multipart/signed; boundary="nextPart3289772.5m0sU25Cs3"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3289772.5m0sU25Cs3
Content-Type: multipart/mixed; boundary="nextPart57150843.cYcY3uocLT"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart57150843.cYcY3uocLT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Thanks for the insights

On Montag, 30. Januar 2017 08:36:19 CET Adrian Chadd wrote:
[...]
> * I can't talk about what Christian did, where he got the board data
> from, etc, etc. You mentioned a DK style board, but didn't say which.

    model = "Qualcomm Technologies, Inc. IPQ40xx/AP-DK01.1-C1";
    compatible = "qcom,ipq40xx-apdk01.1", "qcom,ipq40xx";

This is actually how the board (unfortunately) still identifies itself
and selects the device tree according to this compatibility string.

> * For example, the ath10k in the "official" QSDK software reference
> platform doesn't work out of the box on DK07, because the BMI IDs
> aren't in the default IPQ4017 config (eg DK07 can be 2G/5G/pcie or
> 5G/5G/pcie, depending!)
> * .. and the cascade/besra NICs that ship in the DK07 reference boards
> also don't exist in the ath10k board-2.bin file because again they're
> boards whose BMI IDs aren't shipped;

It is using IDs which are already available in the board-2.bin. They are the 
same ids which are already used in all the board-2.bin files from Christian 
Lamparter ("bus=ahb,bmi-chip-id=0,bmi-board-id=16" + "bus=ahb,bmi-chip-
id=0,bmi-board-id=17"). They all have the same IDs but different content. This 
was the problem I saw the first time and which confused me a lot.

At 0:ART 0x1000 I saw:

    refDesignId = 0x10, 
    customerId = 0x0, 
    projectId = 0x0, 

At 0:ART 0x5000 I saw:

    refDesignId = 0x11, 
    customerId = 0x0, 
    projectId = 0x0, 

> [17:33:44] <adri> how big is the precal data block?
> [17:33:49] <adri> in bytes?
> [17:36:22] <adri> there, responded


Btw. it looks to me that the calibration data in the 0:ART is exactly 12064 
bytes long. Just because you've asked about it in #ath10k. There is something 
else at 0x9000 which is 12500 bytes long - no idea what this could be.

> [17:36:32] <adri> the TL;DR is - the BMI IDs aren't freaking unique between
> vendors too :(

So I would guess that the manufacturer should have allocated new IDs and set 
them in the pre-cal parts of the ART partition (but only when they use a 
different reference board.bin). But I am a little bit confused that it is 
called refDesignId (which seems to suggest that 16/17 are referencing the 
DK01.1-C1 somehow). And I am also currently unsure if customerId or projectId 
should end up as ATH10K_BMI_CHIP_ID_FROM_OTP (bmi-chip-id). A quick test 
(modifying these values in the ART) showed that they are basically ignored and 
chip-id stayed at 0 (changing the refDesignId seemed to work).

[...]
> If people aren't using unique BMI IDs (which is another question we
> have for QCA) then it's possible you don't have enough information to
> "know" which board data to use, so it has to be overridden by a custom
> package. We do this at work for our own boards as well - they're
> sufficiently different to a reference board that indeed we need to
> "know".

Hm, looks like we also have to poke the manufacturer and QCA about this.

> Now, the reason for pre-loading the calibration data is because it's
> needed early in the boot process so the firmware/driver has some idea
> of what the hardware is.
> 
> So, the driver steps should be:
> 
> * If you have a pre-calibration file, you load that in before you kick
> the firmware too hard;
> * then you read the calibration data /back/ - then the normal firmware
> process will fetch the board ID;
> * then it loads the board-2.bin matching the board/BMI ID, then
> * starts things normally.
> 
> Now, I forget if the pre-cal data (and say, data in flash versus data
> in OTP) is the whole thing or a diff against the board data. I'd have
> to triple-check. The OTP data is certainly just a diff against the
> board data.

Yes, this was what I would expect from the OTP data. See below regarding my 
guess regarding the pre-cal data.

> It's possible they could shave off some of these steps if you have
> pre-cal data, but I bet it's done like this to minimise the amount of
> special casing going on. Each step may have a special case, but once
> you get to the "fetch board ID" step it should continue along
> correctly.

You are talking about (possibly) shaving off the board-2.bin loading? This is 
at least what I would have expected when looking at the QCA988x based boards 
with calibration data in the flash. But this would not explain why Christian 
Lamparter (which seems to have pre-cal data in the flash of the AC58U) had do 
exchange his board-2.bin to get the board working.

Let us ask Raja Mani about it (who implemented it for ath10k [1]). It looks to 
me that point 4 in his commit message is talking about 
ath10k_download_and_run_otp in ath10k_core_pre_cal_config. And the device will 
just copy parts of the pre-calibration data over the board(-2).bin data. So it 
would count as a diff and therefore requires the correct board-2.bin. So each 
board.bin would require an own id (bad idea - really bad idea when we only 
have 1 byte for bmi-board-id and a lot of vendors with their own board.bin 
files).


Kind regards,
	Sven

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?
id=3d9195ea19e4854d7daa11688b01905e244aead9

--nextPart57150843.cYcY3uocLT
Content-Disposition: attachment; filename="art.xz"
Content-Transfer-Encoding: base64
Content-Type: application/x-xz; name="art.xz"

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


--nextPart57150843.cYcY3uocLT--

--nextPart3289772.5m0sU25Cs3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAliQYwMACgkQXYcKB8Em
e0YUkRAA1q1XpL+sR29a9U7Mt5N2lVpjYJdRHJeRftLB0rr7GFCU8PUwTXM5tFsY
JIfVSfLK5BuTQdgPWG8M7v0Ujv/9Zx0vmv9s1mMqujxVtS8klWRJnDEWWKd0Ksn/
e5ZrjMm4n6i6h6WSC4LFwF9Dgboxdx3VmZWxdAvZMcPrxuZe+V0UYiE0RYfKIOb+
lCNidvme7l41RsPA6HFC9AmLKboL/kAgT13DI6Ggjwc2OLI6Tfy1VUu7o9S1l8uc
5r0nTyHu/1hr3mekL+/RvdsjcqYXStOmAF1zVNQ39vgNnuwcN2lM/gbHnuhMDOvN
iQvlJ1YWNVAalM0Sjzal017i4VS9kLQKT1SA4AYHOUfmBVWPPT6GJ4nfAqzC+vOz
QUZb3Rpd7m0PCgPo22qd+zWpXcbsYnf8QTJg6jZrpzh+ccg2nzPVQk/8YdPj90bo
TO1U9QxjjME2+4oJrUIoUEzTkj45RZDQyoqK9DlUxEmrhEF69UfzelrueocLdlmR
lwY816ey2KPYpSm55sLFWLQY1NKK3O7v+7bH4HNh+JtuXGtcdb3lCZvtV4ZTelEm
xKk6kfFYbwphkwcf/Qdz5q4GcCjfCM1UgejWbXduEvER//p7q2EDanqHyRyueW43
L3/63ezOH+q5nifThKiEf2HJLhsO+4hniT27j/LeWLXUmNQx58Q=
=A9I4
-----END PGP SIGNATURE-----

--nextPart3289772.5m0sU25Cs3--



--===============8306767690436136120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8306767690436136120==--
