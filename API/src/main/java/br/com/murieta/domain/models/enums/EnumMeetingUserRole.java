package br.com.murieta.domain.models.enums;

public enum EnumMeetingUserRole {
    Owner(1, "Owner"),
    Spectator(2, "Spectator"),
    Speaker(3, "Speaker");

    private final Integer code;
    private final String description;

    EnumMeetingUserRole(Integer _code, String _description) {
        code = _code;
        description = _description;
    }

    public Integer getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }
}
